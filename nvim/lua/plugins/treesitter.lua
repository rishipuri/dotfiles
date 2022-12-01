require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "javascript",
        "lua",
        "python",
        "rust",
        "typescript",
    },
    highlight = {
        enable = true,
    }
}
