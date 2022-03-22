#!/bin/zsh

function symlink {
  ln -nsf $1 $2
}

PS3='Computer type: '
select computer in Personal Shopify
do

case $computer in
  "Personal")
  echo "Symlinking personal gitconfig"
  symlink $PWD/home/.personal.gitconfig ~/.computer.gitconfig
  break
  ;;

  "Shopify")
  echo "Symlinking Shopify gitconfig"
  symlink $PWD/home/.shopify.gitconfig ~/.computer.gitconfig
  break
  ;;

  *)
  echo "Invalid computer type"
  break
  ;;
  esac
done

echo "Symlinking common dotfiles"
symlink $PWD/home/.aliases ~/.aliases
symlink $PWD/home/.zshrc ~/.zshrc
symlink $PWD/home/.gitconfig ~/.gitconfig
