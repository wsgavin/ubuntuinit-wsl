#!/bin/sh

echo
printf "Initializing vim..."

mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/backups"
mkdir -p "$HOME/.vim/swaps"
mkdir -p "$HOME/.vim/undo"
mkdir -p "$HOME/.vim/autoload"
mkdir -p "$HOME/.vim/bundle"

echo "done."

# Install pathogen

if [ ! -f "$HOME/.vim/autoload/pathogen.vim" ]; then

  curl -LSso "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim

fi

# Installing some plugins

if [ ! -d "$HOME/.vim/bundle/vim-sensible" ]; then

  git clone git://github.com/tpope/vim-sensible.git \
    "$HOME/.vim/bundle/vim-sensible"
  #git clone git://github.com/altercation/vim-colors-solarized.git \
  #  "$HOME/.vim/bundle/vim-colors-solarized"

fi

echo
