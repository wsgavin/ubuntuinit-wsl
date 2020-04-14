#!/bin/sh

echo
printf "Initializing ssh..."

mkdir -p $HOME/.ssh

cat <<EOT >> ${HOME}/.bashrc
#### ssh ####

[ -e "\$HOME/.ssh/config" ] && \
  complete -o "default" \
  -o "nospace" \
  -W "$(grep "^Host" ~/.ssh/config |\
    grep -v "[?*]" | \
    cut -d " " -f2 | \
    tr ' ' '\n')" \
  scp sftp ssh

#### ssh ####
EOT

echo "done."
