local packages = {
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua", name = "nvim-tree.lua" },
  { src = "https://github.com/akinsho/bufferline.nvim", name = "bufferline.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm.nvim" },
  { src = "https://github.com/folke/which-key.nvim", name = "which-key.nvim" },
  { src = "https://github.com/sainnhe/everforest", name = "everforest" },
  { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim", name = "mason.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", name = "telescope.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
  { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns.nvim" },
}

local added, error_message = pcall(vim.pack.add, packages, { load = false })
if not added then
  vim.schedule(function()
    vim.notify("Plugin bootstrap failed: " .. error_message .. ". Run :NvimSync when connectivity is available.", vim.log.levels.WARN)
  end)
end

local function packadd(name)
  local ok = pcall(vim.cmd.packadd, name)
  if not ok then
    vim.schedule(function()
      vim.notify(name .. " is unavailable. Run :NvimSync when connectivity is available.", vim.log.levels.WARN)
    end)
  end
  return ok
end

for _, name in ipairs({
  "nvim-web-devicons",
  "bufferline.nvim",
  "lualine.nvim",
  "which-key.nvim",
  "everforest",
  "nvim-lspconfig",
  "mason.nvim",
}) do
  packadd(name)
end

local mason_ok, mason = pcall(require, "mason")
if mason_ok then
  mason.setup()
end

local function install_tools()
  local mason_ok = pcall(require, "mason")
  if not mason_ok then
    vim.notify("Mason is unavailable. Run :NvimSync when connectivity is available.", vim.log.levels.WARN)
    return
  end

  vim.cmd("MasonInstall clangd cmake-language-server lua-language-server opencl-language-server")
end

local function sync()
  local ok, err = pcall(vim.pack.update, nil, { target = "lockfile" })
  if not ok then
    vim.notify("Plugin sync failed: " .. err .. ". Run :NvimSync to retry.", vim.log.levels.ERROR)
    return
  end
  install_tools()
end

vim.api.nvim_create_user_command("NvimBootstrap", sync, { desc = "Install pinned plugins and language tools" })
vim.api.nvim_create_user_command("NvimSync", sync, { desc = "Synchronize pinned plugins and language tools" })
vim.api.nvim_create_user_command("NvimUpdate", function()
  vim.pack.update()
end, { desc = "Review available plugin updates" })

if vim.fn.executable("slangd") == 0 then
  vim.schedule(function()
    vim.notify("slangd is not on PATH. Install an official Slang release, then restart Neovim.", vim.log.levels.WARN)
  end)
end

return { load = packadd }
