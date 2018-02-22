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

  call dein#add('morhetz/gruvbox')

  call dein#add('somini/vim-autoclose')
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')          " Leader-n
  call dein#add('beloglazov/vim-online-thesaurus')      " Leader-t
  call dein#add('junegunn/goyo.vim')                    " Leader-g

  call dein#add('christoomey/vim-tmux-navigator')

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

set termguicolors

set background=dark
let g:gruvbox_termcolors=256
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

set number
set relativenumber
set cursorline
set clipboard=unnamedplus
set scrolloff=3

set noswapfile
set nobackup
set nowritebackup

filetype plugin on

let mapleader=","

inoremap jj <Esc>
" nnoremap <C-n> :bnext<CR>
" nnoremap <C-p> :bprevious<CR>
" nnoremap <C-k> <C-w><C-k>
" nnoremap <C-j> <C-w><C-j>
" nnoremap <C-h> <C-w><C-h>
" nnoremap <C-l> <C-w><C-l>
nnoremap <Leader>n :NERDTreeToggle<CR>

set splitbelow
set splitright

set autochdir
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {c-h} :TmuxNavigateLeft<cr>
nnoremap <silent> {c-j} :TmuxNavigateDown<cr>
nnoremap <silent> {c-k} :TmuxNavigateUp<cr>
nnoremap <silent> {c-l} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Thesaurus mapping

let g:online_thesaurus_map_keys = 0
nnoremap <Leader>t :OnlineThesaurusCurrentWord<CR>

" Goyo mapping and settings

nnoremap <silent> <Leader>g :Goyo<CR>

"---------- Check awesome rc file ----------

autocmd BufWritePost $HOME/.config/awesome/rc.lua !awesome -k

"---------- indentation/tabs/etc ----------

set smartindent
set expandtab
set smarttab
set ts=4 sw=4 et

