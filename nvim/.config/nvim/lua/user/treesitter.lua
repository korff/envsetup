local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { "bash", "c", "cmake", "cpp", "json", "lua", "python", "yaml", "markdown", "markdown_inline", "zig" }, -- one of "all" or a list of languages
    ignore_install = { "phpdoc", "php", "go" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css" } },
})
