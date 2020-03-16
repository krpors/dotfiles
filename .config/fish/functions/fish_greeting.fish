function fish_greeting
	if test -e ~/.cache/feed_motd
		command cat ~/.cache/feed_motd
	end
end
