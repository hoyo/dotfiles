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

"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"vundleの設定
set nocompatible
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle "Shougo/neocomplcache"
Bundle "thinca/vim-ref"
Bundle "mattn/zencoding-vim"
Bundle "mattn/webapi-vim"
Bundle "mattn/mkdpreview-vim"
Bundle "motemen/git-vim.git"
Bundle "yko/mojo.vim"
filetype plugin indent on

"Ref phpmanualで参照するHTMLを指定
nmap ,php :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = $HOME . '/.vim/resource/phpmanual'

"Ref webdictでalcを使う設定
nmap ,alc :<C-u>Ref webdict alc<Space>
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'
let g:ref_source_webdict_use_cache = 1
let g:ref_source_webdict_sites = {
\ 'alc' : {
\   'url' : 'http://eow.alc.co.jp/%s/UTF-8/'
\   }
\ }
function! g:ref_source_webdict_sites.alc.filter(output)
  return join(split(a:output, "\n")[42 :], "\n")
endfunction

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

