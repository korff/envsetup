local function fail(message)
  error("minimal-nvim smoke check: " .. message, 0)
end

local function assert_equal(actual, expected, context)
  if actual ~= expected then
    fail(string.format("%s: expected %q, got %q", context, expected, actual))
  end
end

local function filetype_for(name)
  return vim.filetype.match({ filename = name })
end

if vim.fn.has("nvim-0.12") ~= 1 then
  fail("Neovim 0.12 or later is required")
end

for _, command in ipairs({
  "NvimBootstrap",
  "NvimSync",
  "SearchFiles",
  "SearchText",
  "ExplorerToggle",
  "TerminalToggle",
  "GitNextHunk",
  "GitPreviousHunk",
  "GitPreviewHunk",
  "GitStageHunk",
  "GitResetHunk",
  "GitBlameLine",
  "GitDiff",
  "CMakeConfigure",
  "CMakeBuild",
  "CMakeTest",
}) do
  if vim.fn.exists(":" .. command) ~= 2 then
    fail("missing command: " .. command)
  end
end

for name, expected in pairs({
  ["kernel.cl"] = "opencl",
  ["kernel.clh"] = "opencl",
  ["shader.slang"] = "slang",
  ["shader.metal"] = "metal",
  ["kernel.cu"] = "cuda",
  ["shader.glsl"] = "glsl",
  ["shader.hlsl"] = "hlsl",
}) do
  assert_equal(filetype_for(name), expected, "filetype for " .. name)
end

assert_equal(vim.treesitter.language.get_lang("metal"), "cpp", "Metal parser fallback")

if vim.fn.executable("slangd") == 0 then
  local messages = vim.api.nvim_exec2("messages", { output = true }).output
  if not messages:find("slangd", 1, true) then
    fail("missing slangd guidance")
  end
end

print("minimal-nvim smoke check passed")
