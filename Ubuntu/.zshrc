# enable color
autoload -Uz colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# command prompt
PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
$ "

# completions
autoload -Uz compinit
compinit

# match lower case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' ignore-parents parent pwd ..

# vcs_info
if [ -f ~/.vcs_info ]; then
  . ~/.vcs_info
fi

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
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# extensive ls
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'
alias l='ls'

# do interactively
if type trash > /dev/null 2>&1; then
  alias rm='trash'
else
  alias rm='rm -i'
fi
alias mv='mv -i'
alias cp='cp -i'

# global alias
alias -g C='| xsel --clipboard --input'
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g S="| sort"
alias -g W="| wc"

# user alias
if [ -f ~/.zsh_aliases ]; then
   source  ~/.zsh_aliases
fi
