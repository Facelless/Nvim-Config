
require("keymaps")
require("plugins")

vim.api.nvim_set_hl(0, "Function", { bold = false, fg = "#c792ea" })


vim.cmd("highlight clear")
vim.o.background = "dark"
vim.o.termguicolors = true

vim.api.nvim_set_hl(0, "Normal",         { fg = "#d0d0d0", bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat",    { fg = "#d0d0d0", bg = "#000000" })
vim.api.nvim_set_hl(0, "FloatBorder",    { fg = "#555555", bg = "#000000" })
vim.api.nvim_set_hl(0, "SignColumn",     { bg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLine",     { bg = "#0a0a0a" })
vim.api.nvim_set_hl(0, "ColorColumn",    { bg = "#0a0a0a" })
vim.api.nvim_set_hl(0, "WinSeparator",   { fg = "#303030", bg = "#000000" })
vim.api.nvim_set_hl(0, "LineNr",         { fg = "#555555", bg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "Comment",        { fg = "#7a7a7a", italic = true })
vim.api.nvim_set_hl(0, "String",         { fg = "#9a9a9a" })
vim.api.nvim_set_hl(0, "Constant",       { fg = "#b0b0b0" })
vim.api.nvim_set_hl(0, "Number",         { fg = "#b0b0b0" })
vim.api.nvim_set_hl(0, "Function",       { fg = "#c0c0c0" })
vim.api.nvim_set_hl(0, "Identifier",     { fg = "#d0d0d0" })
vim.api.nvim_set_hl(0, "Keyword",        { fg = "#b0b0b0" })
vim.api.nvim_set_hl(0, "Operator",       { fg = "#c0c0c0" })
vim.api.nvim_set_hl(0, "Type",           { fg = "#a0a0a0" })
vim.api.nvim_set_hl(0, "Visual",         { bg = "#222222" })
vim.api.nvim_set_hl(0, "Search",         { fg = "#000000", bg = "#888888" })
vim.api.nvim_set_hl(0, "MatchParen",     { bg = "#333333" })
vim.api.nvim_set_hl(0, "Cursor",         { fg = "#000000", bg = "#ffffff" })
vim.api.nvim_set_hl(0, "StatusLine",     { fg = "#d0d0d0", bg = "#111111" })
vim.api.nvim_set_hl(0, "StatusLineNC",   { fg = "#7a7a7a", bg = "#111111" })

vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#d0d0d0", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { fg = "#d0d0d0", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#cfcfcf" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#d0d0d0" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#222222", bg = "#000000" })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty",  { fg = "#222222" })
vim.api.nvim_set_hl(0, "NvimTreeGitNew",    { fg = "#111111" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted",{ fg = "#330000" })
vim.o.list = false
vim.o.fillchars = "eob: "

vim.o.number = true
vim.o.relativenumber = false