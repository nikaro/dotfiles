function clip
	switch (uname)
		case Darwin
			xargs echo -n | pbcopy
		case '*'
			xclip -selection clipboard -rmlastnl
	end
end
