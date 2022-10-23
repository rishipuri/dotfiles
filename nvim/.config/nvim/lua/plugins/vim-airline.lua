vim.cmd [[
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1

    " Show just the filename
    let g:airline#extensions#tabline#fnamemod = ':t'

    " Show buffer number
    let g:airline#extensions#tabline#buffer_nr_show = 1

    " Enable powerline fonts
    let g:airline_powerline_fonts = 1

    " Statusline for NvimTree and other custom filetypes
    let g:airline_filetype_overrides = {
        \ 'NvimTree': [ 'File Explorer', '' ],
        \ }
]]
