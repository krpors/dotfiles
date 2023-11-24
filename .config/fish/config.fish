set JAVA_HOME ~/Apps/jdk-11.0.4+11
set GOPATH ~/Development/go
set GOROOT ~/Apps/go
set LOVE_HOME ~/Apps/love2d
set LUAROCKS_HOME ~/.luarocks
set M2_HOME ~/Apps/apache-maven-3.5.2

fish_add_path $JAVA_HOME/bin
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin
fish_add_path $M2_HOME/bin
fish_add_path $LOVE_HOME
fish_add_path ~/.cargo/bin
fish_add_path ~/.nimble/bin

set TMOUT 0

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
