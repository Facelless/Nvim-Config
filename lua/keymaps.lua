vim.g.mapleader = " "

vim.keymap.set('n', '<leader>q', vim.cmd.q)

vim.keymap.set('n', '<C-s>', function() vim.cmd('w') end, { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', function() vim.cmd('w') end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { noremap = true, silent = true })

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-c>', '"+y', { noremap = true, silent = true })

vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<Esc>"+pa', { noremap = true, silent = true })
vim.keymap.set('v', '<C-v>', '"+p', { noremap = true, silent = true })

vim.keymap.set('n', '<C-t>', function()
  local win_code = vim.api.nvim_get_current_win()
  vim.cmd("vsplit")
  vim.cmd("terminal")
  vim.cmd("wincmd L")
  vim.api.nvim_set_current_win(win_code)
end, { noremap = true, silent = true })

vim.keymap.set('v', '<BS>', '"_d', { noremap = true, silent = true })
vim.keymap.set({'n','i','v'}, '<C-z>', '<Esc>u', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', function()
  local ok, nvim_tree = pcall(require, "nvim-tree")
  if ok then
    require("nvim-tree.api").tree.toggle()
  end
end, { noremap = true, silent = true })