if has('gui_macvim')
  set showtabline=2   "タブを常に表示
  set imdisable       "IMを無効化
  set transparency=7  "透明度を指定
  set guioptions-=T   "ツールバー非表示
  set antialias
  set guifontwide=Osaka-Mono:h12
  set guifont=Osaka-Mono:h13
  set columns=140
  set lines=45

  colorscheme desert
  highlight LineNr guifg=grey guibg=#444444
endif

" Cmd-A is Select all
noremap <D-a> gggH<C-O>G
inoremap <D-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <D-a> <C-C>gggH<C-O>G
onoremap <D-a> <C-C>gggH<C-O>G
snoremap <D-a> <C-C>gggH<C-O>G
xnoremap <D-a> <C-C>ggVG

