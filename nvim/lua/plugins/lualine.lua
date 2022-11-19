require('lualine').setup {
    options = {
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        },
        theme = 'gruvbox-material',
    },
    sections = {
        lualine_b = {
            {
                'branch',
            },
            {
                'diff',
            },
            {
                'diagnostics',
                symbols = {
                    error = 'E',
                    warn = 'W',
                    info = 'I',
                    hint = 'H',
                },
            },
        },
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
        lualine_x = {'filetype'},
        lualine_y = {
            {
                'encoding',
            },
            {
                'fileformat',
                symbols = {
                    unix = 'unix',
                    dos = 'dos',
                    mac = 'mac',
                },
            },
        },
        lualine_z = {'searchcount', 'progress', 'location'},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 4,
                max_length = vim.o.columns,
                filetype_names = {
                    NvimTree = 'File Explorer',
                },
            },
        },
    },
}
