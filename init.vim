:set number  
:set autoindent 
:set mouse=a 

call plug#begin() 

" NERDTree plugin
Plug 'preservim/nerdtree'

" One Dark theme
Plug 'joshdick/onedark.vim'

" vim-airline plugin
Plug 'vim-airline/vim-airline'

" ToggleTerm plugin
Plug 'akinsho/toggleterm.nvim'

" vim-commentary plugin. For commenting use gcc & gc 
Plug 'tpope/vim-commentary' 

call plug#end()

" Commands for Plugins to work

nnoremap <C-n> :NERDTreeToggle<CR>

syntax on
set background=dark
colorscheme onedark

let g:airline_section_b = '%{expand("%:~:.")}'

lua << EOF
require("toggleterm").setup{
  size = 20,                      -- Default terminal height or width
  open_mapping = [[<c-t>]],        -- Toggle terminal with Ctrl + t
  shade_terminals = true,          -- Shade terminal for better visibility
  direction = 'horizontal',        -- Set terminal to open horizontally
}
EOF
