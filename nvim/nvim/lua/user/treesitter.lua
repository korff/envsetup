local packages = require("user.packages")
local workflows = require("user.workflows")

vim.treesitter.language.register("c", "opencl")
vim.treesitter.language.register("cpp", "metal")
vim.treesitter.language.register("shaderslang", "slang")

local group = vim.api.nvim_create_augroup("minimal_nvim_treesitter", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "c", "cpp", "cmake", "cuda", "glsl", "hlsl", "lua", "metal", "opencl", "slang" },
  once = true,
  callback = function()
    if not packages.load("nvim-treesitter") then
      return
    end
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if ok then
      configs.setup({
        ensure_installed = { "c", "cmake", "cpp", "cuda", "glsl", "hlsl", "lua", "shaderslang" },
        highlight = { enable = true },
      })
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  once = true,
  callback = function()
    workflows.setup_gitsigns()
  end,
})
