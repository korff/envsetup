# Minimal Neovim Configuration

This configuration requires Neovim 0.12 or later and uses native `vim.pack`.
Install it with the repository's stow workflow, then run `:NvimBootstrap` in
Neovim to synchronize the commit-pinned plugins and Mason-managed tools.
Run `:NvimSync` to retry a failed bootstrap. Use `:NvimUpdate` to review
plugin updates; commit the resulting `nvim-pack-lock.json` only after review.

Mason manages `clangd`, `cmake-language-server`, `lua-language-server`, and
`opencl-language-server`. OpenCL diagnostics also require a usable host OpenCL
ICD/runtime. Install `slangd` from an official Slang release and put it on
`PATH`; it is intentionally not Mason-managed. Metal has filetype detection
and C++ parser highlighting only, without Metal-specific LSP or formatting.

Commands provide the workflow groups: `:SearchFiles`, `:SearchText`,
`:ExplorerToggle`, `:TerminalToggle`, `:Git*Hunk`, `:GitBlameLine`, and
`:CMakeConfigure`, `:CMakeBuild`, `:CMakeTest`. CMake commands run from the
nearest build marker or Git root. Override their shell commands with
`vim.g.nvim_cmakeconfigure_command`, `vim.g.nvim_cmakebuild_command`, and
`vim.g.nvim_cmaketest_command`.

Run the smoke check with:

```sh
XDG_CONFIG_HOME="$PWD/nvim" nvim --headless \
  '+lua dofile("'$PWD'/nvim/nvim/tests/smoke.lua")' +qa
```
