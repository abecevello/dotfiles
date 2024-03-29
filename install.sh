#!/bin/zsh

function symlink {
  ln -nsf $1 $2
}

function common_files {
  echo "Symlinking common dotfiles"
  symlink $PWD/home/.aliases ~/.aliases
  symlink $PWD/home/.zshrc ~/.zshrc
  symlink $PWD/home/.gitconfig ~/.gitconfig
  symlink $PWD/home/.gitignore ~/.gitignore
}

if [ "$SPIN" ]; then
  symlink $PWD/home/.shopify.gitconfig ~/.computer.gitconfig
  common_files

  pip install git-delete-merged-branches
  nix-env -i diff-so-fancy
else
  PS3='Computer type: '
  select computer in Personal Shopify
  do

  case $computer in
    "Personal")
    echo "Symlinking personal gitconfig"
    symlink $PWD/home/.personal.gitconfig ~/.computer.gitconfig
    common_files
    break
    ;;

    "Shopify")
    echo "Symlinking Shopify gitconfig"
    symlink $PWD/home/.shopify.gitconfig ~/.computer.gitconfig
    common_files
    break
    ;;

    *)
    echo "Invalid computer type"
    break
    ;;
    esac
  done

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install git-delete-merged-branches diff-so-fancy
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
