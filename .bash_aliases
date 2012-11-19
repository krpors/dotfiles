#!/bin/bash

# list all in a listing, color and almost-all (A) and sort by ext, and human readable format.
alias l='ls -lah --color --group-directories-first'
alias ll='ls -l --color --group-directories-first' 

# Time a command using /usr/bin/time instead of builtin time
alias time2='/usr/bin/time --format "Command:    %C\nReal time:  %E\n%%CPU:       %P"'

# Custom netstat
alias netstat2='netstat -a -p -t --numeric-hosts --numeric-ports'
