" Enable line numbers, auto-indentation, and mouse support
set number
set autoindent
set mouse=a

" Start plugin installation
call plug#begin('~/.vim/plugged')


" One Dark theme
Plug 'joshdick/onedark.vim'

" vim-airline plugin
Plug 'vim-airline/vim-airline'

" Install coc.nvim for code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ToggleTerm plugin for terminal management
Plug 'akinsho/toggleterm.nvim'

" vim-commentary plugin for easy commenting
Plug 'tpope/vim-commentary'

" File manager
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " Required for file icons

" floating cmdline
Plug 'MunifTanjim/nui.nvim'
Plug 'VonHeikemen/fine-cmdline.nvim'

" Dev icons plugin
Plug 'ryanoasis/vim-devicons'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope for fuzzy finding
Plug 'nvim-lua/plenary.nvim'  " Required for telescope.nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

" End plugin installation
call plug#end()

" Commands for Plugins to work


" Syntax highlighting and colorscheme settings
syntax on
set background=dark
colorscheme onedark

" Airline configuration
let g:airline_section_b = '%{expand("%:~:.")}'

" Use Tab for completion and navigate to the next item
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Telescope key mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>

" Lua configuration for plugins
lua << EOF
require("toggleterm").setup {
  size = 20,                     -- Default terminal height or width
  open_mapping = [[<c-t>]],       -- Toggle terminal with Ctrl + t
  shade_terminals = true,         -- Shade terminal for better visibility
  direction = 'horizontal',       -- Set terminal to open horizontally
}




require('nvim-tree').setup {
  auto_close = true,
  renderer = {
    icons = {
      show = {
        folder = true,
        file = true,
        git = true,
      },
    },
  },
  view = {
    width = 30, 
    side = 'left'
  }
}

EOF

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap : <cmd>FineCmdline<CR>
