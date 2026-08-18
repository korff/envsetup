local M = {}
local opt = vim.opt

M.root_markers = {
  "compile_commands.json",
  "CMakePresets.json",
  "CMakeLists.txt",
  "meson.build",
  "Makefile",
  ".git",
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.clipboard:append("unnamedplus")
opt.completeopt = { "menuone", "noselect", "fuzzy", "nosort" }
opt.complete:append("o")
opt.autocomplete = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.updatetime = 250
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.formatoptions:remove({ "c", "r", "o" })

local map = vim.keymap.set
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
map("n", "<S-h>", "<cmd>bprevious<cr>", { silent = true })
map("n", "<S-l>", "<cmd>bnext<cr>", { silent = true })
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })
map("v", "p", '"_dP', { silent = true })
map("x", "J", ":move '>+1<cr>gv=gv", { silent = true })
map("x", "K", ":move '<-2<cr>gv=gv", { silent = true })

local group = vim.api.nvim_create_augroup("minimal_nvim", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "qf", "help", "man" },
  callback = function()
    map("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    local opt_local = vim.opt_local
    opt_local.wrap = true
    opt_local.spell = true
  end,
})

function M.root(buffer)
  return vim.fs.root(buffer or 0, M.root_markers) or vim.uv.cwd()
end

return M
