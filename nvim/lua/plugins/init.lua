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
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
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

    -- lsp
    use('neovim/nvim-lspconfig')

    -- auto completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp')

    -- tpope
    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-obsession')

    use('lewis6991/gitsigns.nvim')

    use('jiangmiao/auto-pairs')

    if packer_bootstrap then
        packer.sync()
    end
end)
