function dnsquery
	dscacheutil -q host -a name $argv[1]
end
