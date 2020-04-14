#!/bin/sh

echo
echo Installing and configuring AWS tools...

#TODO add input for configuring.

# Adding now to remove message later after install
export PATH=$HOME/.local/bin:$PATH

pip install --upgrade --user awscli

cat <<EOT >> ${HOME}/.bashrc
#### awscli ####

export LOCAL_HOME_ROOT="$HOME/.local"
export PATH="\$LOCAL_HOME_ROOT/bin:\$PATH"

#### awscli ####
EOT
