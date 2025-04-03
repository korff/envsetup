local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "cuda",
        "fish",
        "glsl",
        "hlsl",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "meson",
        "ninja",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "zig"
    },
    ignore_install = { "phpdoc", "php", "go" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,
        disable = {},
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python" }
    },
})
