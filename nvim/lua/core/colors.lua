vim.cmd [[
    let g:gruvbox_contrast_dark = 'hard'
    " colorscheme gruvbox
    colorscheme kanagawa
]]

-- for transparent bg
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
