-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup(function(use)
    use('wbthomason/packer.nvim')

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- status line
    use('nvim-lualine/lualine.nvim')

    -- search
    use('junegunn/fzf')
    use('junegunn/fzf.vim')

    -- file explorer
    use('nvim-tree/nvim-tree.lua')

    -- colorscheme
    use('gruvbox-community/gruvbox')
    use('rebelot/kanagawa.nvim')

    -- lsp
    use('neovim/nvim-lspconfig')

    -- auto completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp')

    -- snippet
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- tpope
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-obsession')

    -- git
    use('lewis6991/gitsigns.nvim')

    use('jiangmiao/auto-pairs')
    use('ojroques/vim-oscyank')

    if packer_bootstrap then
        packer.sync()
    end
end)
