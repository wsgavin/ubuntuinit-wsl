#!/bin/bash

command -v lsb_release >/dev/null 2>&1 ||
  {
    echo
    echo "Does not appear to be a Linux platfrom."
    exit 1
  }

dist_id=$(lsb_release -si)
release=$(lsb_release -sr)
dist_id_support="Ubuntu"
release_support="17.04,17.10,18.04,18.10,19.04,20.04"

# Setting some color constants
COLOR_GREEN="\x1b[0;32m"
COLOR_RED="\x1b[0;31m"
COLOR_RESET="\x1b[0m"

# Setting some escaped characters
CHAR_CHECKMARK="\xE2\x9C\x93"
CHAR_XMARK="\xE2\x9C\x97"

echo
echo $dist_id $release

if [[ "$dist_id_support" != *"$dist_id"* ]] || \
  [[ "$release_support" != *"$release"* ]]; then
  echo
  echo -e >&2 "${COLOR_RED}${CHAR_XMARK}${COLOR_RESET} Linux release not supported."
  exit 1
fi

echo
# If we've made it here we should be good.
echo -e "${COLOR_GREEN}${CHAR_CHECKMARK}${COLOR_RESET} Linux version supported."

echo
echo "Performing some checks to ensure ubuntuinit can continue."

# check for sudoers access

# Reseting sudo; just to ensure the test goes as planned.
sudo -k

stty -echo
echo
echo "Enter the sudo password for this system to validate access."
echo
printf "Enter password: "
read -r sudo_password
stty echo
echo
echo

# Reseting sudo; just to ensure the test goes as planned.
sudo -k

# Attempting to use the entered password with sudo.
is_sudoer="$(echo $sudo_password | sudo -vS &>/dev/null)"

# If the exit status $? is not 0 something went wrong and we'll exit.
[ $? -eq 0 ] ||
  {
    echo -e >&2 "${COLOR_RED}${CHAR_XMARK}${COLOR_RESET} sudo access denied."
    echo
    echo "Talk with your system administrator for sudoer access."
    echo
    exit 1;
  }

# Unsetting for good measure...
unset is_sudoer

# If we've made it here we should be good.
echo -e "${COLOR_GREEN}${CHAR_CHECKMARK}${COLOR_RESET} sudoers access."

# echo
# echo "Doing some work as we know we need to get some dependencies..."
#
# sudo apt install git -y
#
# echo "done."

# Checking for git...
command -v git >/dev/null 2>&1 ||
  {
    echo -e >&2 "${COLOR_RED}${CHAR_XMARK}${COLOR_RESET} git not installed.";
    echo;
    read -p "Would you like to install git? [Y/n]: " yn

    case "$yn" in
      ""|[Yy])
          sudo apt install git -y
        ;;
      *)
        echo "Run 'sudo apt-get install git -y' and rerun this script.";
        echo
        exit 1;
        ;;
    esac

  }

# Getting here does assumes if we attemtped to install git it worked.
echo -e "${COLOR_GREEN}${CHAR_CHECKMARK}${COLOR_RESET} git installed."

#echo
#git clone https://github.com/wsgavin/ubuntuinit-desktop
