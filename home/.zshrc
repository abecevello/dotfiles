export GOPATH=$HOME
export PATH=$GOPATH/bin::$PATH
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/gnupg/libexec/gpgbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# I miss my old bash prompt
export PS1="%F{33}%n@%m:%~\$ %f"

# I like vim
export EDITOR="vim"

# Use useful editor for `gem open`
export GEM_EDITOR="code"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Enable auto completion in zsh
autoload -Uz compinit
compinit

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# added by Nix installer
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh;
fi
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
