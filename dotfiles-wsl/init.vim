" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Installed | coc-html, coc-css, coc-clangd (c/cpp), coc-emmet, coc-prettier, coc-tsserver, coc-pyright
" Check coc-settings.json

Plug 'arcticicestudio/nord-vim'  " Nord Theme
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs
Plug 'preservim/nerdtree'  " File Tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree
Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
Plug 'ryanoasis/vim-devicons'  " icons
call plug#end()

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set autoindent
set smartindent
set number  " line numbers for my sanity
syntax enable  " enable syntax highlighting

set showmatch  " show matching brackets

" prettier formatting configs are in ~/.prettierrc
" as for the other languages, just use the language servers provided by coc.nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <C-f> :Prettier<CR>

" use true colours
if (has("nvim"))
	" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
if (has("termguicolors"))
	set termguicolors
endif

" Remaps for File Tree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline

" Fast Escape for Status Bar
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

" Nord Theme
let g:nord_bold_vertical_split_line = 1  " bold vertical-split line
let g:nord_uniform_diff_background = 1  " uniform diff background
colorscheme nord  " set nord colorscheme
