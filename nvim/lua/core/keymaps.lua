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

-- quickfix/location list navigation
map('n', '[q', ':cprev<CR>')
map('n', ']q', ':cnext<CR>')
map('n', '[l', ':lprev<CR>')
map('n', ']l', ':lnext<CR>')

-- NvimTree
map('n', '<Leader>b', ':NvimTreeToggle<CR>')
map('n', '<Leader>f', ':NvimTreeFindFile<CR>')

-- gitsigns
map('n', '<Leader>gs', ':Gitsigns toggle_signs<CR>')
map('n', '<Leader>gn', ':Gitsigns toggle_numhl<CR>')
map('n', '<Leader>gl', ':Gitsigns toggle_linehl<CR>')
map('n', '<Leader>gb', ':Gitsigns toggle_current_line_blame<CR>')
map('n', '[c', ':Gitsigns prev_hunk<CR>')
map('n', ']c', ':Gitsigns next_hunk<CR>')
