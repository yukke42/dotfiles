# 非環境依存

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
# setopt ignore_eof

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

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# vsc_info
if [ -f ~/.vcs_info ]; then
   source  ~/.vcs_info
fi

### aliases ###
# enable color
if [ `uname` = 'Linux' ]; then
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ `uname` = 'Darwin' ]; then
  alias ls='ls -G'
  alias grep='grep --color=always'
fi
if type colordiff > /dev/null 2>&1; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# extensive ls
alias la='ls -A'
alias ll='ls -lh'
alias lla='ll -A'
alias l='ls'

if type trash > /dev/null 2>&1; then
  alias rm='trash'
else
  alias rm='rm -i'
fi
alias mv='mv -i'
alias cp='cp -i'

# global alias
if type pbcopy > /dev/null 2>&1; then
  alias -g C='| pbcopy'
elif type xsel > /dev/null 2>&1; then
  alias -g C='| xsel --clipboard --input'
fi
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g S="| sort"
alias -g W="| wc"

alias .='cd ../'
alias ..='cd ../../'

if [ -f ~/.zsh_aliases ]; then
   source  ~/.zsh_aliases
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=true

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


