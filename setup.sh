#!/bin/bash

#set -e

# Just because, clearing some variables that are shared between other scripts.
unset account_password
unset git_fullname
unset git_email

. init/banner.sh
. init/check.sh
. init/input.sh
. init/repos.sh

# Initializing apt
sudo apt update
sudo apt upgrade -y

# Installing various applications...
#
# While these installs could by done in one line, I just felt it was easier
# to read and update.
#
sudo apt install git -y
sudo apt install vim -y
sudo apt install nmap -y
sudo apt install moreutils -y
sudo apt install curl -y
sudo apt install ctags -y
sudo apt install atom -y
sudo apt install google-chrome-stable -y
sudo apt install shellcheck -y
sudo apt install xclip -y
sudo apt install sqlite3 -y

sudo apt install build-essential -y
sudo apt install linux-headers-"$(uname -r)" -y

#needed for rbenv
sudo apt install autoconf -y
sudo apt install bison -y
sudo apt install libssl-dev -y
sudo apt install libyaml-dev -y
sudo apt install libreadline6-dev -y
sudo apt install libncurses5-dev -y
sudo apt install libffi-dev -y
sudo apt install zlib1g-dev -y

# needed for pyenv
sudo apt install libbz2-dev -y
sudo apt install libsqlite3-dev -y

sudo apt clean
sudo apt autoclean
sudo apt autoremove -y

# Initializing scripts...
. init/gnome.sh
. init/git.sh
. init/vim.sh
. init/bash.sh
. init/ssh.sh
. init/nodejs.sh
. init/atom.sh
. init/ruby.sh
. init/python.sh
. init/aws.sh

exit 0
