export GOPATH=$HOME
export PATH=$GOPATH/bin::$PATH
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/gnupg/libexec/gpgbin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Shadowenv changes the HOST environment variable to be 127.0.0.1, preventing the correct hostname from appearing in the prompt
export ORIGINAL_HOSTNAME="${${(%):-$(hostname)}%.local}"

# Change command prompt format
export PS1="%F{33}$ORIGINAL_HOSTNAME:%~\$ %f"

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Correct small spelling mistakes
setopt correct

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
