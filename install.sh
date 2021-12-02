#!/bin/zsh

function symlink {
  ln -nsf $1 $2
}

symlink $PWD/home/.aliases ~/.aliases
symlink $PWD/home/.gitconfig ~/.gitconfig
symlink $PWD/home/.shopify.gitconfig ~/.shopify.gitconfig
symlink $PWD/home/.zshrc ~/.zshrc
