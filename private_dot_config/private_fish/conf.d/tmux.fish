# Start tmux automatically

if status is-interactive
and not set -q TMUX
and not set -q VSCODE_TERM
    exec tmux new -A -s main
end
