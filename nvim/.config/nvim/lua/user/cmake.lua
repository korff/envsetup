local status_ok, cmake = pcall(require, "cmake-tools")
if not status_ok then
  return
end

cmake.setup({
  cmake_command = "cmake",
  cmake_build_directory = "",
  cmake_build_directory_prefix = "cmake_build/dev",
  cmake_build_type = "Debug",
  cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" , "-G", "Xcode"},
  cmake_build_options = {},
  cmake_console_size = 10, -- cmake output window height
  cmake_show_console = "always", -- "always", "only_on_error"
  cmake_dap_configuration = {
    name = "cpp",
    type = "codelldb",
    request = "launch",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  }, -- dap configuration, optional
  -- cmake_dap_open_command = require("dap").repl.open, -- optional
  cmake_variants_message = {
    short = { show = true },
    long = { show = true, max_length = 40 }
  }
})
