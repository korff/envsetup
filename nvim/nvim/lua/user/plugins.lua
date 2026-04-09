-- plugins go here
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
    { src = "https://github.com/windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
    -- "numToStr/Comment.nvim",
    -- -- "JoosepAlviste/nvim-ts-context-commentstring",
    { src = "https://github.com/kyazdani42/nvim-web-devicons" },
    { src = "https://github.com/kyazdani42/nvim-tree.lua" },
    { src = "https://github.com/akinsho/bufferline.nvim" },
    -- "moll/vim-bbye",
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/ahmedkhalf/project.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { src = "https://github.com/folke/which-key.nvim" },
    -- "kylechui/nvim-surround",

    -- Colorschemes
    { src = "https://github.com/sainnhe/everforest" },
    -- { src = "https://github.com/sainnhe/gruvbox-material" },

    -- Completions
    { src = "https://github.com/hrsh7th/nvim-cmp" },     -- The completion plugin
    { src = "https://github.com/hrsh7th/cmp-buffer" },   -- buffer completions
    { src = "https://github.com/hrsh7th/cmp-path" },     -- path completions
    { src = "https://github.com/hrsh7th/cmp-cmdline" },  -- nvim command line completions
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lua" },
    -- "saadparwaiz1/cmp_luasnip",
    --
    -- -- Snippets
    -- "L3MON4D3/LuaSnip",
    --
    -- -- LSP
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" }, -- simple to use language server installer
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/RRethy/vim-illuminate" },
    --
    -- -- Language support
    -- "tikhomirov/vim-glsl",
    -- "petRUShka/vim-opencl",
    -- "fei6409/log-highlight.nvim",

    -- Telescope
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" },

    -- Treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },

    -- -- Git
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    --
    -- Tools
    -- "Civitasv/cmake-tools.nvim",
})
