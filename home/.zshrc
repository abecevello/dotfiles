export GOPATH=$HOME
export PATH=$GOPATH/bin::$PATH
export PATH="/usr/local/opt/gnupg/libexec/gpgbin:$PATH"
export PATH=$PATH:/Applications/p4merge.app/Contents/MacOS
export NIX_PATH="~/.nix-profile/bin/nix"

# I miss my old bash prompt
export PS1="%F{33}%n@%m:%~\$ %f"

# I like vim
export EDITOR="vim"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
