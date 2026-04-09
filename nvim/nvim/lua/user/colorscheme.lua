local colorscheme = "everforest"

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_transparent_background = 1

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
