function fish_prompt
	set st $status
	set_color --bold brwhite
	echo -n [(date "+%H:%m")]
	set_color --bold yellow
	echo -n " "(prompt_hostname)
	set_color --bold brgreen
	echo -n " "(prompt_pwd)

	if test "$st" -gt 0
		set_color --bold red
	else
		set_color --bold green
	end
	echo " ("$st")"

	set_color normal
	echo -n '╰⟶ '
end

