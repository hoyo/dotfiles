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

"Ref phpmanualで参照するHTMLを指定
let g:ref_phpmanual_path = $HOME . '/Dropbox/phpmanual'

"Zen-Codingのキーバインド変更
let g:user_zen_expandabbr_key = '<c-e>'
"let g:use_zen_complete_tag = 1

