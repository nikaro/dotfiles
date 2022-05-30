function ssh-ignore --wraps ssh
	ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" $argv
end
