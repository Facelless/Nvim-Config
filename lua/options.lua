vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false

vim.o.backspace = "indent,eol,start"
vim.o.history = 1000
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('data') .. '/undo'

vim.o.autoread = true
vim.o.clipboard = "unnamedplus"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.whichwrap = "b,s,h,l,<,>,[,]"

