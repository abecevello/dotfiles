#!/bin/zsh

function symlink {
  ln -nsf $1 $2
}

symlink ~/dotfiles/home/.aliases ~/.aliases
symlink ~/dotfiles/home/.gitconfig ~/.gitconfig
symlink ~/dotfiles/home/.shopify.gitconfig ~/.shopify.gitconfig
symlink ~/dotfiles/home/.zshrc ~/.zshrc
