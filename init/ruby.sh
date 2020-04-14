#!/bin/sh

# Setting some color constants
COLOR_GREEN="\x1b[0;32m"
COLOR_RESET="\x1b[0m"

# Setting some escaped characters
CHAR_ARROW="\xE2\x9E\x9C"

echo
echo Installing and configuring ruby...
echo
echo Installing rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo
echo Installing ruby-build plugin
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "gem: --no-document" > ~/.gemrc

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Grabbing the latest version release of ruby.
RUBY_VER="$(rbenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*$/ h;${g;p;}' | tr -d '[:space:]')"

cat <<EOT >> ${HOME}/.bashrc
#### rbenv ####

export RBENV_ROOT="\$HOME/.rbenv"
export PATH="\$RBENV_ROOT/bin:\$PATH"

eval "\$(rbenv init -)"

export RUBY_VER_INSTALLED="${RUBY_VER}"
export RUBY_VER_LATEST="\$(rbenv install -l | sed -n '/^[[:space:]]*[0-9]\{1,\}\.[0-9]\{1,\}\.[0-9]\{1,\}[[:space:]]*\$/ h;\${g;p;}' | tr -d '[:space:]')"

if [ "\$RUBY_VER_INSTALLED" != "\$RUBY_VER_LATEST" ]; then
    echo -e "${COLOR_GREEN}${CHAR_ARROW}${COLOR_RESET} New version of ruby is available: \$RUBY_VER_INSTALLED -> ${COLOR_GREEN}\$RUBY_VER_LATEST${COLOR_RESET}"
fi

#### rbenv ####
EOT

echo
rbenv install "$RUBY_VER"
echo
rbenv global "$RUBY_VER"
echo

gem update
echo
gem cleanup
echo

gem install jekyll
echo
gem install bundler
echo
gem install s3_website

rbenv rehash

# rm -rf ~/.rbenv ~/.gemrc ~/.gem ~/.bundler
# sed -i '/#### rbenv/, /#### rbenv/d' ~/.bashrc
