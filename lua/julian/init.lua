vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Salir
vim.keymap.set('n', '<C-x>', ':qa<CR>', { noremap = true, silent = true, desc = 'E[x]it Neovim' })
vim.keymap.set('i', '<C-x>', '<Esc>:qa<CR>', { noremap = true, silent = true, desc = 'E[x]it Neovim' })

-- Buffers
vim.keymap.set('n', '<C-p>', ':bp<CR>', { noremap = true, silent = true, desc = '[P]revious Buffer' })
vim.keymap.set('n', '<C-n>', ':bn<CR>', { noremap = true, silent = true, desc = '[N]ext Buffer' })
vim.keymap.set('n', '<Tab>', ':bp<CR>', { noremap = true, silent = true, desc = '[P]revious Buffer' })

-- Neotree
vim.keymap.set('n', '<C-e>', ':Neotree<CR>', { noremap = true, silent = true, desc = 'File [E]xplorer' })
vim.keymap.set('i', '<C-e>', '<Esc>:w<CR>:Neotree<CR>', { noremap = true, silent = true, desc = 'File [E]xplorer' })

-- Save file
vim.keymap.set('n', '<C-s>', '<Cmd>lua SaveFile()<CR>', { desc = '[S]ave File' })
vim.keymap.set('i', '<C-s>', '<Cmd>lua SaveFile()<CR>', { desc = '[S]ave File' })

function SaveFile()
  vim.lsp.buf.format()
  vim.cmd.w()
end

-- Numbers
vim.keymap.set('n', '<leader>saa', '<Cmd>lua NumbersShow()<CR>', { desc = 'Numbers Show' })
vim.keymap.set('n', '<leader>sad', '<Cmd>lua NumbersHide()<CR>', { desc = 'Numbers Hide' })

function NumbersShow()
  vim.opt.number = true
  vim.opt.relativenumber = true
end

function NumbersHide()
  vim.opt.number = false
  vim.opt.relativenumber = false
end
