#!/bin/bash

echo
echo Installing and configuring nodejs...

git clone https://github.com/nodenv/nodenv.git ~/.nodenv

export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"

mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

eval "$(nodenv init -)"

# Grabbing the latest version release of python.
NODEJS_VER="$(nodenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}' | tr -d '[:space:]')"

cat <<EOT >> ${HOME}/.bashrc
#### nodenv ####

export NODENV_ROOT="\$HOME/.nodenv"
export PATH="\$NODENV_ROOT/bin:\$PATH"

eval "\$(nodenv init -)"

export NODEJS_VER_INSTALLED="${NODEJS_VER}"
export NODEJS_VER_LATEST="\$(nodenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*\$/ h;\${g;p;}' | tr -d '[:space:]')"

if [ "\$NODEJS_VER_INSTALLED" != "\$NODEJS_VER_LATEST" ]; then
    echo -e "${COLOR_GREEN}${CHAR_ARROW}${COLOR_RESET} New version of nodejs is available: \$NODEJS_VER_INSTALLED -> ${COLOR_GREEN}\$NODEJS_VER_LATEST${COLOR_RESET}"
fi

#### nodenv ####
EOT

echo
nodenv install "$NODEJS_VER"
echo
nodenv global "$NODEJS_VER"
echo
npm update --global

nodenv rehash

# rm -rf ~/.nodenv ~/.npm
# sed -i '/#### nodenv/, /#### nodenv/d' ~/.bashrc
