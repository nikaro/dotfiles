function dnsflushcache
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
end
