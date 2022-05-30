function ansible-var --wraps ansible
	ansible -m debug $argv[1] -a var="hostvars[inventory_hostname].$argv[2]" --playbook-dir=./plays/
end
