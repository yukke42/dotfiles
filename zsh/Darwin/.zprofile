# 環境依存

PROMPT="%F{magenta}[%n@%m]%f %~
$ "

# http://nemoplus.hateblo.jp/entry/20090119/1232373540
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# vim
export PATH=/usr/local/bin/vim:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
if type rbenv > /dev/null 2>&1;then
  eval "$(rbenv init -)";
fi

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if type pyenv > /dev/null 2>&1;then
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

# embulk
export PATH=$HOME/.embulk/bin:$PATH

# golang glide
export GO15VENDOREXPERIMENT=1

# goenv
if type goenv > /dev/null 2>&1;then
  eval "$(goenv init -)"
fi

# direnv
if type direnv > /dev/null 2>&1;then
  eval "$(direnv hook zsh)"
fi
