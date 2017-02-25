#!/bin/sh

echo "🏆 Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "🏆 Installing bash-completion..."
brew install bash-completion

source linker.sh
