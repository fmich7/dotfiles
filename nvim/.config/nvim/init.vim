" < General >
" ===========
let mapleader = ","
set number " shows line number
set relativenumber " relative line number
set mouse=a " enables mouse
set noshowmode " disables mode information [-- INSERT --]
set clipboard+=unnamedplus " copy to clipboard "+y
set encoding=UTF-8

" < Tabs and spaces >
" ===================
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

" < Plugins/extensions >
" ======================
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion/lang
Plug 'tpope/vim-fugitive' " git support :!git
Plug 'airblade/vim-gitgutter' " git diff in the sign column +/-
Plug 'jiangmiao/auto-pairs' " auto (), {}, [] etc.
Plug 'lambdalisue/battery.vim' " info about battery level
"Plug 'honza/vim-snippets' " vim-snippets, needs fix

Plug 'preservim/nerdtree' " files tree
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " colored tree
Plug 'ryanoasis/vim-devicons' " file type icons

Plug 'vim-airline/vim-airline' " custom line at bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox' " gruvbox theme
Plug 'luochen1990/rainbow' " rainbow parentheses

Plug 'leafgarland/typescript-vim' " typescript support
Plug 'peitalin/vim-jsx-typescript' " react support
call plug#end()

" < Airline >
" ===========
let g:airline_powerline_fonts=1
" ---> Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
"" ---> Bottomline
let g:airline_section_z = '%l/%L C:%v'
let g:airline_section_y = '%{battery#component()}'

" < Theme/colors >
" ================
set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
let g:rainbow_active = 0 " toggle rainbow parenthesess
let g:airline_theme='dark_minimal'

" < Shortcuts/binds >
" ===================
nnoremap <C-n> :tabnew<CR> " open new tab
map <leader>vc :tabnew $MYVIMRC<CR> " open init.vim in vertical tab
nnoremap <S-Tab> :tabprevious<CR> " go to previous tab
nnoremap <Tab> :tabnext<CR> " go to next tab
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
" save file in insert mode with ctrl + s
inoremap <c-s> <Esc>:w<CR>a

" < NerdTree >
" ============
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" ---> Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" < Pasted from docs >
" ====================
" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
