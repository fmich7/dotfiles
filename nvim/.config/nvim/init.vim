" < General >
let mapleader = ","
set encoding=UTF-8
set number " shows line number
set relativenumber " relative line number
set mouse=a " enables mouse
set noshowmode " disables mode information [-- INSERT --]
set clipboard+=unnamedplus " copy and paste outside vim
set cursorline " highlight current line
set showmatch " highlight matching brackets
set signcolumn=yes " always show signcolumns
set splitbelow " better split
set splitright " ^
" ===========

" < Tabs and spaces >
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent
" ===================

" < Plugins/extensions >
call plug#begin('~/.config/nvim/plugged')
" ---> Essentials
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletion/lang
Plug 'airblade/vim-gitgutter' " git diff in the sign column +/-

" ---> Useful
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround' " asd -> [asd]
Plug 'tpope/vim-commentary' " comment plugin
Plug 'jiangmiao/auto-pairs' " auto (), [], {}
Plug 'lambdalisue/battery.vim' " battery level
Plug 'psf/black', { 'branch': 'stable' } " python code formatter

" ---> Tree view dir
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ---> Themes/interface
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---> Languages
Plug 'leafgarland/typescript-vim' " typescript support
Plug 'peitalin/vim-jsx-typescript' " react support

Plug 'ryanoasis/vim-devicons' " various icons/must be last, so other plugins can load earlier
call plug#end()
" =============

" < Airline >
let g:airline_powerline_fonts=1
let g:airline#extensions#battery#enabled = 1
" ---> Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#tab_nr_type = 1
" ---> Bottomline
let g:airline_section_z = '%l/%L C:%v'
" let g:airline_section_y = '%{battery#component()}'
" ==================================================

" < Theme/colors >
set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
let g:airline_theme='dark_minimal'
" ================================

" < NerdTree >
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" ---> Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" ================

" < Shortcuts/binds >
nnoremap <C-n> :tabnew<CR> " open new tab
map <leader>vc :tabnew $MYVIMRC<CR> " open init.vim in vertical tab
nnoremap <silent><Tab> :tabnext<CR> " go to next tab
nnoremap <silent><S-Tab> :tabprevious<CR> " go to previous tab
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight
" save file in insert mode with ctrl + s
inoremap <c-s> <Esc>:w<CR>a

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Run Black on save
autocmd BufWritePre *.py execute ':Black'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <tab> used for trigger completion, completion confirm, snippet expand like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" ====================
