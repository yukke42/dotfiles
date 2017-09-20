# enable color
autoload -Uz colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# command prompt
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
$ "

# completions
autoload -Uz compinit
compinit

# match lower case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
      LANG=en_US.UTF-8 vcs_info
          RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# enable wildcard
bindkey '^R' history-incremental-pattern-search-backward


# common alias
# enable color
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# extensive ls
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'
alias l='ls'

# do interactively
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# global alias
alias -g C='| pbcopy'
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g S="| sort"
alias -g W="| wc"

alias .='cd ../'
alias ..='cd ../../'

# user alias
if [ -f ~/.zsh_aliases ]; then
   source  ~/.zsh_aliases
fi

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

