# .zprofile 環境依存

PROMPT="%F{cyan}[%n@%m]%f %~
$ "

export LANG=ja_JP.UTF-8

export PATH=/usr/games:/usr/local/games:/snap/bin
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

# cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if type pyenv > /dev/null 2>&1;then
  eval "$(pyenv init -)"
fi

# direnv
if type direnv > /dev/null 2>&1;then
  eval "$(direnv hook zsh)"
fi

# pycharm
if [ -d "$HOME/.local/pycharm-2018.2.4/bin" ] ; then
    PATH="$HOME/.local/pycharm-2018.2.4/bin:$PATH"
fi

