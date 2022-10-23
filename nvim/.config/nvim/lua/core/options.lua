local opt = vim.opt

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.modeline = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.colorcolumn = '80'

opt.list = true

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true

opt.foldenable = true
opt.foldmethod = 'indent'
opt.foldlevelstart = 10
opt.foldnestmax = 10

opt.lazyredraw = true
opt.redrawtime = 10000
opt.updatetime = 300

if vim.fn.executable('rg') == 1 then
    opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end
