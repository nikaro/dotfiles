function ssh-load-keys
	ssh-add --apple-use-keychain (find ~/.ssh -name 'id_*' -not -name '*.pub')
end
