" General
let mapleader = ","
set number " shows line number
set relativenumber " relative line number
set mouse=a " enables mouse
set noshowmode " disables mode information [-- INSERT --]
set clipboard+=unnamedplus " copy to clipboard "+y
set encoding=UTF-8

" Tabs and spaces
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

" Plugins
call plug#begin('~/.config/nvim/plugged')
" autocompletion and langages support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim' " custom line at bottom
Plug 'morhetz/gruvbox' " neovim theme
Plug 'jiangmiao/auto-pairs' " auto (), {}, [] etc.
Plug 'tpope/vim-fugitive' " git support
Plug 'honza/vim-snippets' " vim-snippets, needs fix

Plug 'leafgarland/typescript-vim' " typescript support
Plug 'peitalin/vim-jsx-typescript' " react support

Plug 'preservim/nerdtree' " files tree
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " colored tree
Plug 'ryanoasis/vim-devicons' " file type icons
Plug 'luochen1990/rainbow' " rainbow parentheses
call plug#end()

" Theme
set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
let g:rainbow_active = 0 " toggle rainbow parenthesess

" Shortcuts
nnoremap <C-n> :tabnew<CR> " open new tab
map <leader>evc :vsp $MYVIMRC<CR> " open init.vim in vertical tab
nnoremap <S-Tab> :tabprevious<CR> " go to previous tab
nnoremap <Tab> :tabnext<CR> " go to next tab
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
