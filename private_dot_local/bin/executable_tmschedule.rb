#!/usr/bin/env ruby

require 'optparse'
require 'pp'
require 'yaml'

HOUR = 3600
DAY = HOUR * 24
WEEK = DAY * 7
MONTH = DAY * 30
YEAR = DAY * 365

class Snap
  def initialize(name)
    @name = name
    @date_str = @name.match(/\d{4}-\d{2}-\d{2}-\d{6}/).to_a.first
    @date = Time.new(*@name.match(/(\d{4})-(\d{2})-(\d{2})-(\d{2})(\d{2})(\d{2})/).captures)
  end

  attr_reader :name, :date_str, :date
end

class TMSchedule
  def initialize
    @retention = read_config
    @period = set_periods
    @snapshots = list_snapshots
  end

  def read_config
    config_file = ENV['HOME'] + '/.config/tmschedule.yml'
    config = { 'frequently' => 4, 'hourly' => 24, 'daily' => 7, 'weekly' => 4, 'monthly' => 6, 'yearly' => 0 }
    config.merge!(YAML.load_file(config_file)) if File.exist?(config_file)
    config
  end

  def set_periods
    periods = {}
    @retention.each_key do |key|
      case key
      when 'frequently'
        periods[key.to_sym] = @retention[key].zero? ? 30 * HOUR : HOUR / @retention[key]
      when 'hourly'
        periods[key.to_sym] = @retention[key].zero? ? 30 * HOUR : HOUR
      when 'daily'
        periods[key.to_sym] = @retention[key].zero? ? 30 * DAY : DAY
      when 'weekly'
        periods[key.to_sym] = @retention[key].zero? ? 30 * WEEK : WEEK
      when 'monthly'
        periods[key.to_sym] = @retention[key].zero? ? 30 * MONTH : MONTH
      when 'yearly'
        periods[key.to_sym] = @retention[key].zero? ? 30 * YEAR : YEAR
      end
    end
    periods
  end

  def list_snapshots
    snapshots = { frequently: [], hourly: [], daily: [], weekly: [], monthly: [], yearly: [] }
    now = Time.now
    snapshots_cmd = `tmutil listlocalsnapshots / | grep 'com\.apple\.TimeMachine\.'`
    snapshots_cmd.lines.map(&:chomp).each do |snap_name|
      snap = Snap.new(snap_name)
      delta = now - snap.date
      snapshots[:frequently].append(snap) if delta.between?(0, HOUR)
      snapshots[:hourly].append(snap) if delta.between?(HOUR, DAY)
      snapshots[:daily].append(snap) if delta.between?(DAY, WEEK)
      snapshots[:weekly].append(snap) if delta.between?(WEEK, MONTH)
      snapshots[:monthly].append(snap) if delta.between?(MONTH, YEAR)
      snapshots[:yearly].append(snap) if delta.between?(YEAR, 30 * YEAR)
    end
    snapshots
  end

  def make_snapshot
    system('tmutil localsnapshot')
    system('logger tmutil localsnapshot')
    # update list
    @snapshots = list_snapshots
  end

  def delete_snapshot(name)
    system("tmutil deletelocalsnapshots #{name}")
    system("logger tmutil deletelocalsnapshots #{name}")
    # update list
    @snapshots = list_snapshots
  end

  def prune_snapshots
    @retention.each_key do |key|
      deleted = ''
      snaps_count = @snapshots[key.to_sym].length
      @snapshots[key.to_sym].each_with_index do |snap, i|
        # break loop there are less snap than the retention limit
        break if snaps_count <= @retention[key]
        # skip current iteration if snap have been deleted
        next if snap.name == deleted

        # check time span between current and next snapshots
        next_snap = @snapshots[key.to_sym][i + 1]
        next_snap_delta = snap.date - next_snap.date

        # skip if time span is greater than the retention period
        next if next_snap_delta > @period[key.to_sym]

        delete_snapshot(next_snap.date_str)
        deleted = next_snap.name
        snaps_count -= 1
      end
    end
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: tmschedule.rb [command]"
  opts.on("-l", "--list", "List snaphosts") do |list|
    options[:list] = list
  end
end.parse!

tms = TMSchedule.new

if options[:list]
  snaps = tms.list_snapshots
  pp snaps
else
  tms.make_snapshot
  tms.prune_snapshots
end
