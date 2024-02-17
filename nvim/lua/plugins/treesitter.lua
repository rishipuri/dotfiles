require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "cpp",
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
