local servers = {
    "azure_pipelines_ls",
    "bashls",
    "clangd",
    -- "cmake",
    "jsonls",
    "lua_ls",
    "marksman",
    "opencl_ls",
    "pyright",
    "slangd",
    "yamlls",
    "zls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end,
})

-- mason binary path
local mason_bin = vim.fn.stdpath('data') .. '/mason/bin/'

-- cpp with frinds
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'c', 'cc', 'cpp', 'h', 'opencl', 'cl' },
    callback = function()
        vim.lsp.start({
            name = 'clangd',
            cmd = { mason_bin .. 'clangd', '--background-index' },
            root_dir = vim.fs.root(0, {'.git', 'compile_commands.json'}),
        })
    end,
})

-- slang
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'shaderslang',
    callback = function()
        print(mason_bin .. 'slangd')
        vim.lsp.start({
            name = 'slangd',
            cmd = { mason_bin .. 'slangd' },
            root_dir = vim.fs.root(0, {'.git' }),
        })
    end,
})

-- lua
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    callback = function()
        print(mason_bin .. 'lua-language-server' )
        vim.lsp.start({
            name = 'lua_ls',
            cmd = { mason_bin .. 'lua-language-server' },
            root_dir = vim.fs.root(0, {'.git'}),
            settings = {
                Lua = {
                    diagnostics = { globals = {'vim'} },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                },
            },
        })
    end,
})

-- CMake
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cmake',
    callback = function()
        vim.lsp.start({
            name = 'cmake',
            cmd = { mason_bin .. 'cmake-language-server' },
            root_dir = vim.fs.root(0, {'.git', 'CMakeLists.txt'}),
        })
    end,
})
