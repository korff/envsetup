local function setup(module, options)
  local ok, plugin = pcall(require, module)
  if ok then
    plugin.setup(options)
  end
end

vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
pcall(vim.cmd.colorscheme, "everforest")

setup("which-key", {})
setup("bufferline", {
  options = {
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "thin",
  },
})
setup("lualine", {
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
})
