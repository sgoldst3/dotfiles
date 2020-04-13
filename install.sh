#!/usr/bin/env bash

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# My apps
CASKS=(
    notion
    spectacle
    dropbox
    iterm2
    visual-studio-code
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}


# TODO: make this an array with sources and destinations
# TODO can set vscode by doing
# code --install-package <blahhh> 

# colors
bash -c  "$(curl -sLo- https://git.io/vQgMr)"

# vim
#TODO: make this an if statement to check that dir already exists...
mkdir -p $PWD/.vim/autoload $PWD/.vim/bundle && \
curl -LSso $PWD/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


echo "Creating symlinks..."
ln -sf $PWD/.gitconfig $HOME/.gitconfig
ln -sf $PWD/.vim $HOME/.vim
ln -sf $PWD/.vimrc $HOME/.vimrc

