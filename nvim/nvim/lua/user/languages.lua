local core = require("user.core")

vim.filetype.add({
  extension = {
    cl = "opencl",
    clh = "opencl",
    slang = "slang",
    metal = "metal",
    cu = "cuda",
    glsl = "glsl",
    hlsl = "hlsl",
  },
})

vim.lsp.config("*", { root_markers = core.root_markers })
vim.lsp.config("clangd", { root_markers = core.root_markers })
vim.lsp.config("cmake", { cmd = { "cmake-language-server" }, root_markers = core.root_markers })
vim.lsp.config("lua_ls", {
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } },
})
vim.lsp.config("opencl_ls", { cmd = { "opencl-language-server" }, filetypes = { "opencl" }, root_markers = core.root_markers })
vim.lsp.config("slangd", { cmd = { "slangd" }, filetypes = { "slang" }, root_markers = core.root_markers })

for _, server in ipairs({ "clangd", "cmake", "lua_ls", "opencl_ls", "slangd" }) do
  pcall(vim.lsp.enable, server)
end

local group = vim.api.nvim_create_augroup("minimal_nvim_lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
    local map = function(keys, action, description)
      vim.keymap.set("n", keys, action, { buffer = event.buf, desc = description })
    end
    map("gd", vim.lsp.buf.definition, "Definition")
    map("gr", vim.lsp.buf.references, "References")
    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>lr", vim.lsp.buf.rename, "Rename")
    map("<leader>la", vim.lsp.buf.code_action, "Code action")
    map("<leader>ls", vim.lsp.buf.document_symbol, "Document symbols")
    map("<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next ...")
    map("<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous ...")
  end,
})
