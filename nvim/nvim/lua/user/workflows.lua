local core = require("user.core")
local packages = require("user.packages")

local function setup_telescope()
  if not packages.load("plenary.nvim") or not packages.load("telescope.nvim") then
    return nil
  end
  local telescope = require("telescope")
  telescope.setup({ defaults = { path_display = { "smart" } } })
  return require("telescope.builtin")
end

local tree_configured = false
local function setup_tree()
  if not packages.load("nvim-web-devicons") or not packages.load("nvim-tree.lua") then
    return false
  end
  if not tree_configured then
    require("nvim-tree").setup({
      update_focused_file = { enable = true, update_cwd = false },
      view = { width = 40, side = "left" },
    })
    tree_configured = true
  end
  return true
end

local function setup_terminal()
  if not packages.load("toggleterm.nvim") then
    return false
  end
  require("toggleterm").setup({
    direction = "float",
    float_opts = { border = "curved" },
    start_in_insert = true,
  })
  return true
end

vim.api.nvim_create_user_command("SearchFiles", function()
  local telescope = setup_telescope()
  if telescope then
    telescope.find_files({ cwd = core.root() })
  end
end, { desc = "Search project files" })
vim.api.nvim_create_user_command("SearchHiddenFiles", function()
  local telescope = setup_telescope()
  if telescope then
    telescope.find_files({ hidden = true, cwd = core.root() })
  end
end, { desc = "Search project all files" })
vim.api.nvim_create_user_command("SearchBuffers", function()
  local telescope = setup_telescope()
  if telescope then
    telescope.buffers()
  end
end, { desc = "Search open files" })
vim.api.nvim_create_user_command("SearchText", function()
  local telescope = setup_telescope()
  if telescope then
    telescope.live_grep({ cwd = core.root() })
  end
end, { desc = "Search project text" })
vim.api.nvim_create_user_command("ExplorerToggle", function()
  if setup_tree() then
    local tree = require("nvim-tree.api").tree
    if tree.is_visible() then
      tree.close()
    else
      tree.open()
    end
  end
end, { desc = "Toggle project explorer" })
vim.api.nvim_create_user_command("TerminalToggle", function()
  if setup_terminal() then
    vim.cmd("ToggleTerm direction=float")
  end
end, { desc = "Toggle floating terminal" })

local function gitsigns()
  if not packages.load("gitsigns.nvim") then
    return nil
  end
  return require("gitsigns")
end

local gitsigns_configured = false
local function setup_gitsigns()
  local plugin = gitsigns()
  if plugin and not gitsigns_configured then
    plugin.setup({
      signs = { add = { text = "|" }, change = { text = "|" }, delete = { text = "_" } },
    })
    gitsigns_configured = true
  end
  return plugin
end

vim.api.nvim_create_user_command("GitNextHunk", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.next_hunk()
  end
end, { desc = "Go to next Git hunk" })
vim.api.nvim_create_user_command("GitPreviousHunk", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.prev_hunk()
  end
end, { desc = "Go to previous Git hunk" })
vim.api.nvim_create_user_command("GitPreviewHunk", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.preview_hunk()
  end
end, { desc = "Preview current Git hunk" })
vim.api.nvim_create_user_command("GitStageHunk", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.stage_hunk()
  end
end, { desc = "Stage current Git hunk" })
vim.api.nvim_create_user_command("GitResetHunk", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.reset_hunk()
  end
end, { desc = "Reset current Git hunk" })
vim.api.nvim_create_user_command("GitBlameLine", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.blame_line({ full = true })
  end
end, { desc = "Blame current Git line" })
vim.api.nvim_create_user_command("GitDiff", function()
  local plugin = setup_gitsigns()
  if plugin then
    plugin.diffthis()
  end
end, { desc = "Diff current Git buffer" })

local function cmake_command(name, fallback)
  vim.api.nvim_create_user_command(name, function()
    local command = vim.g["nvim_" .. name:lower() .. "_command"] or fallback
    vim.system({ vim.o.shell, vim.o.shellcmdflag, command }, { cwd = core.root(), text = true }, function(result)
      vim.schedule(function()
        vim.fn.setqflist({}, "r", { title = name, lines = vim.split(result.stdout .. result.stderr, "\n", { trimempty = true }) })
        vim.cmd("copen")
        if result.code ~= 0 then
          vim.notify(name .. " failed; inspect quickfix output.", vim.log.levels.ERROR)
        end
      end)
    end)
  end, { desc = fallback })
end

local map = vim.keymap.set
map("n", "<leader>sb", "<cmd>SearchBuffers<cr>", { desc = "Search buffers" })
map("n", "<leader>sf", "<cmd>SearchFiles<cr>", { desc = "Search files" })
map("n", "<leader>sg", "<cmd>SearchText<cr>", { desc = "Search text" })
map("n", "<leader>sh", "<cmd>SearchHiddenFiles<cr>", { desc = "Search all files" })
map("n", "<leader>e", "<cmd>ExplorerToggle<cr>", { desc = "Explorer" })
map("n", "<leader>tt", "<cmd>TerminalToggle<cr>", { desc = "Terminal" })
map("n", "]h", "<cmd>GitNextHunk<cr>", { desc = "Next Git hunk" })
map("n", "[h", "<cmd>GitPreviousHunk<cr>", { desc = "Previous Git hunk" })
map("n", "<leader>gp", "<cmd>GitPreviewHunk<cr>", { desc = "Preview Git hunk" })
map("n", "<leader>gs", "<cmd>GitStageHunk<cr>", { desc = "Stage Git hunk" })
map("n", "<leader>gr", "<cmd>GitResetHunk<cr>", { desc = "Reset Git hunk" })
map("n", "<leader>gb", "<cmd>GitBlameLine<cr>", { desc = "Blame Git line" })
map("n", "<leader>gd", "<cmd>GitDiff<cr>", { desc = "Diff Git buffer" })

return { setup_gitsigns = setup_gitsigns }
