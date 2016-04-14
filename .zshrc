typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[8~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey '^[[2~' overwrite-mode

bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line


alias l='ls -la --group-directories-first --color=always'
alias grep='grep --color=always'

# Customize to your needs...
export EDITOR=vim

# zsh specifics
export HISTFILE=~/.zsh_history
export HISTSIZE=99999999
export SAVEHIST=$HISTSIZE
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export TMOUT=0
export TERM=xterm
export PATH=$PATH:~/bin/

autoload -U colors && colors
PROMPT="%{$fg_bold[green]%}%/%{$fg_bold[red]%} %D{%Y-%m-%f} %* %{$fg_bold[yellow]%}(%?)
%{$fg_bold[white]%}$ %{$reset_color%}"

#PROMPT='$fg_bold[blue][$fg[red]%T$fg_bold[blue]]$fg_bold[blue][$fg[yellow]%n@%m:%~$fg[yellow]$(rvm_prompt_info)$fg_bold[blue]]$reset_color
#$ '
