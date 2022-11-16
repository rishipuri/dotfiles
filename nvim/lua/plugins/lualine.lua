require('lualine').setup {
    options = {
        component_separators = { left = '|', right = '|' },
        disabled_filetypes = {
            statusline = { 'NvimTree' }
        },
        theme = 'gruvbox',
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
                show_modified_status = false,
                max_length = vim.o.columns,
                filetype_names = {
                    NvimTree = 'File Explorer',
                },
            },
        },
    },
}
