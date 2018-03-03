" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" フォント
set guifont=Ricty-RegularForPowerline:h10
" コメントアウトの色
hi Comment ctermfg=gray
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
syntax on


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" プラグイン管理
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入

" 非同期文法チェック
Plugin 'w0rp/ale'

" 自動保存
Plugin 'vim-scripts/vim-auto-save'

" ディレクトリツリーの表示
Plugin 'scrooloose/nerdtree'

" コメントアウト切り替え
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on

" 各種プラグインの設定
" ale
" 左端のエラー時カラムを常に表示
let g:ale_sign_column_always = 1
" テキスト保存時のみに実行
let g:ale_lint_on_text_changes = 0


" vim-auto-save
" 自動保存の有効化
let g:auto_save = 1
" INSERTモード時は自動保存しない
let g:auto_save_in_insert_mode = 0
" 保存時のメッセージを表示しない
let g:auto_save_slient = 1
" 実行されるファイルタイプ
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
      \ 'python': ['flake8'],
      \ }

" コードの自動整形
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['autopep8', 'isort'],
      \ 'markdown': [
      \   {buffer, lines -> {'command': 'textlint -c ~/.config/textlintrc -o /dev/null --fix --no-color --quiet %t', 'read_temporary_file': 1}}
      \   ],
      \ }
let g:ale_fix_on_save = 1
" nerdtree
" ディレクトリツリー表示コマンドを Ctrl + k に割り当てる
noremap <C-k> :NERDTreeToggle<CR>
noremap! <C-k> :NERDTreeToffle<CR>
" dotファイルを表示する
let NERDTreeShowHidden=1
