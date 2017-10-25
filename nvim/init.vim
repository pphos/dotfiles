scriptencoding utf-8
set encoding=utf-8

if &compatible
    set nocompatible
endif

"reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

autocmd FileType python setlocal completeopt-=preview

" let g:python_host_prog = expand('~/.pyenv/versions/anaconda3-5.0.0/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/anaconda3-5.0.0/bin/python3')

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければgithubから落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイルを用意しておく
    let g:rc_dir    = expand("~/.config/nvim")
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,         {'lazy': 0})
    call dein#load_toml(s:lazy_toml,    {'lazy': 1})
    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールのものがあればインストール
if dein#check_install()
    call dein#install()
endif


" setting
" 編集中ファイルが変更されたら自動で読み直す
set autoread
" ファイル編集中にスワップファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nobackup

" Visual
" 行番号を表示
set number
" 現在の行を強調
set cursorline
" インデントはスマートインデント
set smartindent
" 括弧入力時に対応する括弧を表示
set showmatch

" Tab
" Tab文字を半角スペースにする
set expandtab
" 行頭偉大のTab文字の表示幅
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" syntax indent
filetype indent plugin on

" Search
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" Key Bind
inoremap <silent> jj <ESC>

"clip board
set clipboard+=unnamedplus

"colorscheme
set background=dark
colorscheme hybrid
autocmd Colorscheme * highlight Comment ctermfg=14

