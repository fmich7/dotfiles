" General
let mapleader = ","
set number
set mouse=a " enables mouse
set noshowmode " disables mode information [-- INSERT --]
set encoding=UTF-8
set relativenumber

" Tabs and spaces
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion
Plug 'itchyny/lightline.vim' " custom line at bottom
Plug 'morhetz/gruvbox' " theme
Plug 'jiangmiao/auto-pairs' " auto ()
Plug 'tpope/vim-fugitive' " git

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'preservim/nerdtree' " files tree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow' " rainbow parentheses
call plug#end()

" Theme
set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
let g:rainbow_active = 0 "Rainbow Parentheses enabled

" Shortcuts
nnoremap <C-n> :tabnew<CR>
map <leader>evc :vsp $MYVIMRC<CR> " open init.vim in vertical tab
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

"NerdTree 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
