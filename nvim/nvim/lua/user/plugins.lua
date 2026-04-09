-- Install your plugins here
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
    -- "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    -- "numToStr/Comment.nvim",
    -- -- "JoosepAlviste/nvim-ts-context-commentstring",
    -- "kyazdani42/nvim-web-devicons",
    { src = "https://github.com/kyazdani42/nvim-tree.lua" },
    { src = "http://github.com/akinsho/bufferline.nvim" },
    -- "moll/vim-bbye",
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    -- "ahmedkhalf/project.nvim",
    -- "lewis6991/impatient.nvim",
    -- {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { src = "https://github.com/folke/which-key.nvim" },
    -- "kylechui/nvim-surround",

    -- Colorschemes
    { src = "https://github.com/sainnhe/everforest" },
    -- "sainnhe/gruvbox-material",

    -- Show Colors
    -- "nvchad/nvim-colorizer.lua",
    --
    -- "junegunn/vim-easy-align",
    --
    -- -- Completions
    -- "hrsh7th/nvim-cmp",     -- The completion plugin
    -- "hrsh7th/cmp-buffer",   -- buffer completions
    -- "hrsh7th/cmp-path",     -- path completions
    -- "hrsh7th/cmp-cmdline",  -- nvim command line completions
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    -- "saadparwaiz1/cmp_luasnip",
    --
    -- -- Snippets
    -- "L3MON4D3/LuaSnip",
    --
    -- -- LSP
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" }, -- simple to use language server installer
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    -- "RRethy/vim-illuminate",
    --
    -- -- Language support
    -- "tikhomirov/vim-glsl",
    -- "petRUShka/vim-opencl",
    -- "fei6409/log-highlight.nvim",

    -- Telescope
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" },

    -- -- Treesitter
    -- "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-context",
    --
    -- -- Git
    -- "tpope/vim-fugitive",
    -- "lewis6991/gitsigns.nvim",
    --
    -- Tools
    -- "Civitasv/cmake-tools.nvim",
})
