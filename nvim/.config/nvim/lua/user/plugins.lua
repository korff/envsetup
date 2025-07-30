local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
    "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    "numToStr/Comment.nvim",
    -- "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-web-devicons",
    {"kyazdani42/nvim-tree.lua", commit="ef305a888be2b9a0627369f00ccebbad88e6e3ce" },
    "akinsho/bufferline.nvim",
    "moll/vim-bbye",
    "nvim-lualine/lualine.nvim",
    "akinsho/toggleterm.nvim",
    "ahmedkhalf/project.nvim",
    "lewis6991/impatient.nvim",
    {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "folke/which-key.nvim",
    "kylechui/nvim-surround",

    -- Colorschemes
    "sainnhe/gruvbox-material",

    -- Show Colors
    "nvchad/nvim-colorizer.lua",

    "junegunn/vim-easy-align",

    -- Completions
    "hrsh7th/nvim-cmp",     -- The completion plugin
    "hrsh7th/cmp-buffer",   -- buffer completions
    "hrsh7th/cmp-path",     -- path completions
    "hrsh7th/cmp-cmdline",  -- nvim command line completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",

    -- Snippets
    "L3MON4D3/LuaSnip",

    -- LSP
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim",
    "RRethy/vim-illuminate",

    -- Language support
    "tikhomirov/vim-glsl",
    "petRUShka/vim-opencl",

    -- Telescope
    { "nvim-telescope/telescope.nvim", dependencies = {
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    } },

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    -- Git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    -- Tools
    -- "Civitasv/cmake-tools.nvim",
})
