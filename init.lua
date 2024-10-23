-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initialize plugins using lazy.nvim
require("lazy").setup({
  -- One Dark theme
  { 'joshdick/onedark.vim' },

  -- Fine command line
  { 'VonHeikemen/fine-cmdline.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },

  -- Airline
  { 'vim-airline/vim-airline' },

  -- Terminal management
  { 'akinsho/toggleterm.nvim' },

  -- Easy commenting
  { 'tpope/vim-commentary' },

  -- File manager
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Dev icons
  { 'ryanoasis/vim-devicons' },

  -- Fuzzy finder (fzf)
  { 'junegunn/fzf', build = function() vim.fn.system('sh -c "cd ~/.local/share/nvim/lazy/fzf && ./install --bin"') end },
  { 'junegunn/fzf.vim' },

  -- Telescope
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', version = '0.1.2' },

  -- Mason for managing LSP servers
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- LSP configurations
  { 'neovim/nvim-lspconfig' },

  -- Completion engine and sources
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Treesitter for syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },

  -- Dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Tagbar for code navigation
  { 'preservim/tagbar' },
})

-- Basic settings
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.mouse = 'a'
vim.cmd[[colorscheme onedark]]  -- Set colorscheme

-- Airline configuration
vim.g.airline_section_b = '%{expand("%:~:.")}'


-- Tagbar setup (optional configurations)
vim.g.tagbar_window_position = 'left'  -- Position of the tagbar window
vim.g.tagbar_ctags_bin = 'ctags'        -- Specify ctags binary if necessary

-- Function to toggle Tagbar with Ctrl + F
function _G.toggle_tagbar()
  vim.cmd('TagbarToggle')
end

-- Key mapping for toggling Tagbar
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua toggle_tagbar()<CR>', { noremap = true, silent = true })



-- ToggleTerm setup
require("toggleterm").setup {
  size = 20,
  open_mapping = [[<c-t>]],
  shade_terminals = true,
  direction = 'horizontal',
}

-- Function to open a floating terminal
function _G.float_terminal()
    require("toggleterm.terminal").Terminal:new({
      direction = "float",
      float_opts = {
        border = "rounded",  -- Use a rounded border
        width = 100,         -- Width of the floating terminal
        height = 30,         -- Height of the floating terminal
        winblend = 3,        -- Transparency
      },
    }):toggle()  -- Toggle the floating terminal
  end
  
vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>lua float_terminal()<CR>', { noremap = true, silent = true })

-- NvimTree setup
require('nvim-tree').setup {
  renderer = {
    icons = {
      show = { folder = true, file = true, git = true },
    },
  },
  view = { width = 30, side = 'left' },
}

-- FineCmdline setup
require('fine-cmdline').setup{}

-- Key mapping for NvimTree toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Mason and LSP setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'pyright', 'ts_ls', 'bashls' }
})

local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup{}  
lspconfig.pyright.setup{}
lspconfig.bashls.setup{}
lspconfig.lua_ls.setup{
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } } }
  }
}

-- Completion setup with nvim-cmp
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
})

-- Treesitter setup for syntax highlighting
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "python", "javascript", "bash", "html", "css" },  -- Add the languages you need
  highlight = {
    enable = true,  -- Enable highlighting
    additional_vim_regex_highlighting = false,  -- Disable Vim's default regex highlighting (optional)
  },
}

-- Dashboard configuration
require('dashboard').setup({
  theme = 'hyper',  -- You can choose from 'hyper', 'dash', 'whale', etc.
  config = {
    header = {
        "Welcome back to Neovim!",
        "                                                             ",
        "                                                             ",
        " ███▄    █   ▓█████    ▒█████     ██▒   █▓   ██▓   ███▄ ▄███▓",
        " ██ ▀█   █   ▓█   ▀   ▒██▒  ██▒▓  ██░   █▒▓  ██▒▓  ██▒▀█▀ ██▒",
        "▓██  ▀█ ██  ▒▒███     ▒██░  ██▒   ▓██  █▒░▒  ██▒▓  ██    ▓██░",
        "▓██▒  ▐▌██  ▒▒▓█  ▄   ▒██   ██░    ▒██ █░░░  ██░▒  ██    ▒██ ",
        "▒██░   ▓██  ░░▒████▒  ░ ████▓▒░     ▒▀█░  ░  ██░▒  ██▒   ░██▒",
        "░ ▒░   ▒ ▒   ░░ ▒░ ░  ░ ▒░▒░▒░      ░ ▐░  ░  ▓  ░   ▒░   ░  ░",
        "░ ░░   ░ ▒  ░ ░ ░  ░    ░ ▒ ▒░      ░ ░░     ▒ ░░    ░      ░",
        "   ░   ░ ░      ░     ░ ░ ░ ▒         ░░     ▒ ░░        ░   ",
        "         ░      ░  ░      ░ ░          ░     ░           ░   ",
        "                                                             ",
        "                                                             ",
        "                                                             ",
    },
    center = {
      { icon = '  ', desc = 'Recently used files', action = 'Telescope oldfiles', shortcut = 'SPC o' },
      { icon = '  ', desc = 'Find File          ', action = 'Telescope find_files', shortcut = 'SPC f f' },
      { icon = '  ', desc = 'Find Word          ', action = 'Telescope live_grep', shortcut = 'SPC f g' },
      { icon = '  ', desc = 'Open Neovim Config ', action = 'edit ~/.config/nvim/init.lua', shortcut = 'SPC c' },
    },
    footer = {
      "                                              ",
      "Check out my GitHub: https://github.com/vegros",
    },
  },
})

-- Telescope configuration
require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = {
                prompt_position = "top",  -- Ensure prompt is at the top
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        sorting_strategy = "ascending",  -- Optional: Control the sorting order
        prompt_prefix = "> ",  -- Customize prompt prefix if desired
    },
})


-- Telescope key mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })

-- FineCmdline setup for command line and floating window
require('fine-cmdline').setup({
    cmdline = {
      enable = true, 
      types = {
        [':'] = {
          prompt = "> ",  
        },
      },
    },
    floating = {
      border = "rounded",  -- Set border style
      height = 15,         -- Height of the floating window
      width = 100,         -- Width of the floating window
      winblend = 10,       -- Background blend for the floating window
    },
  })
  
  -- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true, silent = true })
