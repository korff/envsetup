if vim.fn.has("nvim-0.12") ~= 1 then
  vim.api.nvim_echo({ { "Minimal Neovim Configuration requires Neovim 0.12 or later.", "ErrorMsg" } }, true, {})
  return
end

vim.loader.enable()

require("user.core")
require("user.packages")
require("user.ui")
require("user.workflows")
require("user.languages")
require("user.treesitter")
