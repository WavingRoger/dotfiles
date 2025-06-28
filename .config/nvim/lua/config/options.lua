local set = vim.opt

-- Clipboard
set.clipboard = "unnamedplus" -- Use system clipboard

-- Tabs & Indentation
set.tabstop = 2 -- Number of spaces a tab counts for
set.shiftwidth = 2 -- Size of an indent
set.softtabstop = 2 -- Number of spaces when hitting <Tab>
set.expandtab = true -- Use spaces instead of tabs

-- UI Enhancements
set.number = true -- Show line numbers
set.relativenumber = true -- Relative line numbers
set.cursorline = true -- Highlight current line
set.signcolumn = "yes" -- Always show sign column
set.scrolloff = 8 -- Keep cursor 8 lines above/below screen edge

-- Search
set.ignorecase = true -- Ignore case when searching
set.smartcase = true -- Override ignorecase if search has capitals
set.incsearch = true -- Show match while typing
set.hlsearch = false -- Don't highlight matches after search

-- Behavior
set.wrap = false -- Disable line wrapping
set.backup = false -- Disable backup files
set.writebackup = false
set.swapfile = false -- Disable swap files
set.undofile = true -- Persistent undo

-- Completion and messages
set.updatetime = 300 -- Faster completion
set.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|
set.completeopt = { "menuone", "noselect" }

-- Split behavior
set.splitbelow = true -- Horizontal splits go below
set.splitright = true -- Vertical splits go to the right

-- Colors
set.termguicolors = true -- True color support

-- Encoding
set.encoding = "utf-8"
