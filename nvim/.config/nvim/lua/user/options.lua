local opt = vim.opt

opt.backup = false                                  -- creates a backup file
opt.swapfile = false                                -- creates a swapfile
opt.undofile = true                                 -- enable persistent undo

opt.clipboard:append("unnamedplus")                 -- allows neovim to access the system clipboard
opt.cmdheight = 2                                   -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" }         -- mostly just for cmp
opt.conceallevel = 0                                -- so that `` is visible in markdown files

-- Encoding
vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"                          -- the encoding written to a file

opt.hlsearch = false                                -- highlight all matches on previous search pattern
opt.incsearch = true
opt.ignorecase = true                               -- ignore case in search patterns
opt.mouse = "a"                                     -- allow the mouse to be used in neovim
opt.pumheight = 10                                  -- pop up menu height
opt.showmode = false                                -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2                                 -- always show tabs
opt.smartcase = true                                -- smart case
opt.smartindent = true                              -- make indenting smarter again
opt.splitbelow = true                               -- force all horizontal splits to go below current window
opt.splitright = true                               -- force all vertical splits to go to the right of current window
opt.termguicolors = true                            -- set term gui colors (most terminals support this)
opt.timeoutlen = 300                                -- time to wait for a mapped sequence to complete (in milliseconds)
opt.updatetime = 50                                 -- faster completion (4000ms default)
opt.writebackup = false                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

opt.expandtab = true                                -- convert tabs to spaces
opt.shiftwidth = 4                                  -- the number of spaces inserted for each indentation
opt.tabstop = 4                                     -- insert 2 spaces for a tab

opt.cursorline = true                               -- highlight the current line

opt.number = true                                   -- set numbered lines
opt.relativenumber = true                           -- set relative numbered lines
opt.numberwidth = 4                                 -- set number column width to 2 {default 4}

opt.signcolumn = "yes"                              -- always show the sign column, otherwise it would shift the text each time

opt.isfname:append("@-@")

opt.wrap = true                                     -- display lines as one long line
opt.linebreak = true                                -- companion to wrap, don't split words
opt.scrolloff = 8                                   -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8                               -- minimal number of screen columns either side of cursor if wrap is `false`
opt.guifont = "monospace:h17"                       -- the font used in graphical neovim applications
opt.whichwrap = "bs<>[]hl"                          -- which "horizontal" keys are allowed to travel to prev/next line

-- vim.opt.shortmess = "ilmnrx"                     -- flags to shorten vim messages, see :help 'shortmess'
opt.shortmess:append "c"                            -- don't give |ins-completion-menu| messages
opt.iskeyword:append "-"                            -- hyphenated words recognized by searches
opt.formatoptions:remove({ "c", "r", "o" })         -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.runtimepath:remove("/usr/share/vim/vimfiles")   -- separate vim plugins from neovim in case vim still in use

