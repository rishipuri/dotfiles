local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- buffer navigation
map('n', '<Leader>h', ':bprevious<CR>')
map('n', '<Leader>l', ':bnext<CR>')
map('n', '<Leader>q', ':bdelete<CR>')
map('n', '<Leader><Left>', ':bprevious<CR>')
map('n', '<Leader><Right>', ':bnext<CR>')

-- clear highlighting
map('n', '\\', ':noh<CR>')

-- remap esc
map('i', 'jk', '<Esc>')

-- center window after some movements
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzz')

-- NvimTree
map('n', '<Leader>b', ':NvimTreeToggle<CR>')
map('n', '<Leader>f', ':NvimTreeFindFile<CR>')

-- vim-signify
map('n', '<Leader>st', ':SignifyToggle<CR>')
