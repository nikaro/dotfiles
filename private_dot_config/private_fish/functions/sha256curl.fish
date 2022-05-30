function sha256curl
	curl -sL $argv[1] | shasum -a 256 -
end
