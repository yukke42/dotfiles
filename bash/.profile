# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# homebrew for macOS
if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    echo 'brew is installed'
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    export LD_LIBRARY_PATH="$(brew --prefix readline)/lib"
fi

# homebrew for ubuntu server
if [[ -x $HOME/.linuxbrew/bin/brew ]]; then
    echo 'brew is installed'
    eval $($HOME/.linuxbrew/bin/brew shellenv)
    export LD_LIBRARY_PATH="$(brew --prefix readline)/lib"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[[ -x $HOME/.pyenv/bin/pyenv ]] && eval "$(pyenv init -)"

# pipenv: create .venv in a project directory
export PIPENV_VENV_IN_PROJECT=true

# for ist-server
if [ "$USER" = "u00166" ]; then
    # source built CMake
    [[ -x $HOME/.local/share/cmake-3.14 ]] \
        && export CMAKE_ROOT='$HOME/.local/share/cmake-3.14'

    # for conda
    [[ -x $HOME/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh ]] \
        && . $HOME/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh

    export PATH=$HOME/.pyenv/versions/anaconda3-5.3.1/bin:$PATH
fi

