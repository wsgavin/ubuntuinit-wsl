#!/bin/sh

# Setting some color constants
COLOR_GREEN="\x1b[0;32m"
COLOR_RESET="\x1b[0m"

# Setting some escaped characters
CHAR_ARROW="\xE2\x9E\x9C"

echo
echo Installing and configuring python...
echo

echo Installing pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo
echo Installing pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

# Grabbing the latest version release of python.
PYTHON_VER="$(pyenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}' | tr -d '[:space:]')"

cat <<EOT >> ${HOME}/.bashrc
#### pyenv ####

export PYENV_ROOT="\$HOME/.pyenv"
export PATH="\$PYENV_ROOT/bin:\$PATH"

eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"

export PYTHON_VER_INSTALLED="${PYTHON_VER}"
export PYTHON_VER_LATEST="\$(pyenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*\$/ h;\${g;p;}' | tr -d '[:space:]')"

if [ "\$PYTHON_VER_INSTALLED" != "\$PYTHON_VER_LATEST" ]; then
    echo -e "${COLOR_GREEN}${CHAR_ARROW}${COLOR_RESET} New version of python is available: \$PYTHON_VER_INSTALLED -> ${COLOR_GREEN}\$PYTHON_VER_LATEST${COLOR_RESET}"
fi

#### pyenv ####
EOT

echo
pyenv install "$PYTHON_VER"
echo

pyenv global "$PYTHON_VER"
echo

pip install --upgrade pip
echo

# rm -rf ~/.pyenv
# sed -i '/#### pyenv/, /#### pyenv/d' ~/.bashrc
