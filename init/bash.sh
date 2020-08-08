#!/bin/sh

echo
printf "Initializing home directory with dotfiles..."
cp -r home/.[!.]* ~/
echo "done."


cat << EOT >> "${HOME}"/.bashrc

#### bash_prompt ####

source "${HOME}"/.bash_prompt

#### bash_prompt ####
EOT
