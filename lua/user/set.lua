vim.g.mapleader = " "   -- Set leader character to be SPACE
vim.cmd("syntax on")


-- Indentation, spaces, and newlines.
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.fileformat = "unix"     -- Force \n line endings (not \r\n)
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4


-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true


-- TUI and visual settings.
vim.opt.cmdheight = 2
vim.opt.colorcolumn = "80"
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,line"

vim.opt.list = true
vim.opt.listchars = "tab:> ,trail:-"

vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showbreak = "> "
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.updatetime = 50


-- Window management.
vim.opt.splitbelow = true
vim.opt.splitright = true


-- Other settings.
vim.opt.clipboard = "unnamedplus"   -- Use system clipboard.
vim.opt.isfname:append("@-@")
vim.opt.mouse = "nv"                -- Enable mouse for these modes.
vim.opt.nrformats = "alpha,bin,hex" -- Which types can be incremented.
