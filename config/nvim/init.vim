"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kostis/Git/Shougo/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/kostis/Git/Shougo')
  call dein#begin('/home/kostis/Git/Shougo')

  " Let dein manage dein
  " Required:
  call dein#add('/home/kostis/Git/Shougo/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')

  call dein#add('somini/vim-autoclose')
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('tpope/vim-commentary')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"---------- deoplete ----------

let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ENTER closes popup
inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<CR>"

"---------- Various settings ----------

set number
set relativenumber
set cursorline
set clipboard=unnamedplus
set scrolloff=3

set noswapfile
set nobackup
set nowritebackup

filetype plugin on

"---------- Check awesome rc file ----------

autocmd BufWritePost $HOME/.config/awesome/rc.lua !awesome -k

"---------- indentation/tabs/etc ----------

set ts=4 sw=4 et

