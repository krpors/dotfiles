#!/usr/bin/env bash

printf "This script installs the files in this repository into the current\n"
printf "user's home directory.\n"
printf "\n"
printf "The installation directory will be:\n"
printf "    %s\n" ${HOME}
printf "\n"

function install {
	rsync -a --exclude="install.sh" --exclude=".zshenv" --exclude=".git" . ~/
}

read -p "Continue? (y/n): " cont
if [ "${cont}" == "y" ]; then
	install
	printf "Done!\n"
else
	printf "Exiting without any action.\n"
	exit 0
fi

