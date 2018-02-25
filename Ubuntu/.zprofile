# .zprofile

# Get the aliases and functions
if [ -f $HOME/.zshrc ]; then
    . $HOME/.zshrc
fi

export LANG=ja_JP.UTF-8

PATH="/usr/games:/usr/local/games:/snap/bin"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"