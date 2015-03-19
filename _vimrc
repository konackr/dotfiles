filetype off

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"---------------------------------------------------------------------------
" NeoBundleInstall
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'

NeoBundle 'Shougo/unite.vim'
NeoBundle "git://github.com/Shougo/vimproc"
NeoBundle 'rking/ag.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'

NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle 'thinca/vim-singleton'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'plasticboy/vim-markdown'

" Installation check.
NeoBundleCheck

call neobundle#end()
"---------------------------------------------------------------------------
" ag
" insert modeで開始
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
"---------------------------------------------------------------------------
:set encoding=utf-8
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac
"---------------------------------------------------------------------------
" 行番号を非表示 (number:表示)
set number
" タブや改行を表示 (list:表示)
set list
"---------------------------------------------------------------------------
" singleton
call singleton#enable()
"--------------------------------------------------------------------------
" psude-hotsave
" Vim終了時に現在のセッションを保存する
au VimLeave * mks!  ./vimsession
"引数なし起動の時、前回のsessionを復元
autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | source ./vimsession | endif
function! s:GetBufByte()
    let byte = line2byte(line('$') + 1)
    if byte == -1
        return 0
    else
        return byte - 1
    endif
endfunction
"---------------------------------------------------------------------------
" --remote-tab-silent は手動で設定が必要
" http://www.mk-mode.com/octopress/2012/06/04/04002036/
"---------------------------------------------------------------------------
" 編集に関する設定:
" タブの画面上での幅
set tabstop=2
set shiftwidth=2
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
set cursorline " カレント行のハイライト
"---------------------------------------------------------------------------
" vim-indent-guides
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1
"---------------------------------------------------------------------------
set clipboard=unnamed,autoselect
"---------------------------------------------------------------------------
source $VIMRUNTIME/mswin.vim
"---------------------------------------------------------------------------
"autocmd BufNewFile,BufRead *.coffee setlocal ts=2 sts=2 sw=2
"--------------------------------------------------------------------------
"タブ、空白、改行の可視化
"--------------------------------------------------------------------------
set formatoptions=q

set guioptions-=e
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions+=r
set guioptions-=R

set swapfile
set backup
set directory=C:\Users\z2060193\Applications\vim74-kaoriya-win64\swap
set backupdir=C:\Users\z2060193\Applications\vim74-kaoriya-win64\backup
