-- map leader key
vim.g.mapleader = ' '

-- buffer navigation
vim.keymap.set('n', '<Leader>h', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>l', ':bnext<CR>')
vim.keymap.set('n', '<Leader>q', ':bdelete<CR>')
vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')

-- clear highlighting
vim.keymap.set('n', '\\', ':noh<CR>')

-- remap esc
vim.keymap.set('i', 'jk', '<Esc>')

-- better navigation in file
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- quickfix/location list navigation
vim.keymap.set('n', '[q', ':cprev<CR>')
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[l', ':lprev<CR>')
vim.keymap.set('n', ']l', ':lnext<CR>')

-- NvimTree
vim.keymap.set('n', '<Leader>b', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>')

-- gitsigns
vim.keymap.set('n', '<Leader>gs', ':Gitsigns toggle_signs<CR>')
vim.keymap.set('n', '<Leader>gn', ':Gitsigns toggle_numhl<CR>')
vim.keymap.set('n', '<Leader>gl', ':Gitsigns toggle_linehl<CR>')
vim.keymap.set('n', '<Leader>gb', ':Gitsigns toggle_current_line_blame<CR>')
vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>')
vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>')

-- telescope
vim.keymap.set('n', '<Leader>tf', ':Telescope find_files<CR>')
vim.keymap.set('n', '<Leader>tr', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<Leader>tb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>th', ':Telescope help_tags<CR>')
vim.keymap.set('n', '<Leader>tg', ':Telescope git_files<CR>')

-- fzf
vim.keymap.set('n', '<Leader>sf', ':FZF<CR>')
vim.keymap.set('n', '<Leader>sr', ':Rg<CR>')
vim.keymap.set('n', '<Leader>sR', ':RG<CR>')
vim.keymap.set('n', '<Leader>sb', ':Buf<CR>')
vim.keymap.set('n', '<Leader>sg', ':GFiles<CR>')
