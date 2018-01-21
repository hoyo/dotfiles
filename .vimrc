set nobackup        "バックアップファイル~をつくらない
set autoindent      "オートインデント
set number          "行番号表示
set incsearch       "インクリメンタルサーチ
set ignorecase      "検索時に大文字小文字を無視
set showmatch       "対括弧の表示
set showmode        "モード表示
set backspace=2     "上行末尾の文字を1文字消去
set title           "編集中のファイル名を表示
set ruler           "ルーラーの表示
set tabstop=2       "タブ文字数
set shiftwidth=2    "シフト移動幅
set expandtab       "タブの代わりに空白文字挿入
set nofixeol        "ファイル末尾の改行を自動付与しない

"Display tab and trail
set list
set listchars=tab:▸\ ,trail:-

"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

"カレントウィンドウのみハイライト
set cursorline
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"Dein.vimの設定
if &compatible
  set nocompatible
endif
set runtimepath+=~/Documents/workspace/git/dotfiles/dein.vim
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/neocomplcache')
call dein#add('thinca/vim-ref')
call dein#add('mattn/zencoding-vim')
call dein#add('mattn/webapi-vim')
call dein#add('mattn/mkdpreview-vim')
call dein#add('motemen/git-vim.git')
call dein#add('nanotech/jellybeans.vim')
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('wavded/vim-stylus')
call dein#add('digitaltoad/vim-jade')
call dein#add('joonty/vdebug')
call dein#add('flyinshadow/php_localvarcheck.vim')
call dein#add('posva/vim-vue')
call dein#add('editorconfig/editorconfig-vim')
call dein#end()
filetype plugin indent on
syntax enable

"拡張子ごとのファイルタイプを設定
au BufNewFile,BufRead,BufReadPre *.tss set filetype=javascript
au BufNewFile,BufRead,BufReadPre *.jmk set filetype=javascript
au BufNewFile,BufRead,BufReadPre *.ejs set filetype=html
au BufNewFile,BufRead,BufReadPre *.coffee set filetype=coffee

"拡張子ごとのインデントを設定
autocmd FileType php setlocal sw=4 sts=4 ts=4 et
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType html setlocal sw=2 sts=2 ts=2 et

"Ref phpmanualで参照するHTMLを指定
nmap ,php :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = $HOME . '/.vim/resource/phpmanual'

"Zen-Codingのキーバインド変更
let g:user_zen_expandabbr_key = '<c-e>'
"let g:use_zen_complete_tag = 1

"neocomplcacheの有効化・一部のカスタマイズ
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_smartcase = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_dictionary_filetype_lists = { 
\ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
\ 'perl' : $HOME . '/.vim/dict/perl_functions._functions.dict',
\ 'php' : $HOME . '/.vim/dict/php_functions.dict',
\ 'default' : ''
\ }

"git-vimのキーマッピング等を変更
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
nnoremap <Space>gD :<C-u>GitDiff<Enter>
nnoremap <Space>gs :<C-u>GitStatus<Enter>
nnoremap <Space>gl :<C-u>GitLog<Enter>
nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <Space>ga :<C-u>GitAdd<Enter>
nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <Space>gc :<C-u>GitCommit<Enter>
nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
nnoremap <Space>gp :<C-u>Git push

"dictファイルの指定
autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict
autocmd FileType perl :set dictionary+=~/.vim/dict/perl_functions.dict

"NERDTreeを常に表示
autocmd vimenter * NERDTree
let NERDTreeWinSize=30

"PHPの未定義変数のチェック
let g:php_localvarcheck_enable=1
let g:php_localvarcheck_global=0
