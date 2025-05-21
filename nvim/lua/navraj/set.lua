vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .."/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.breakindent = true

vim.opt.signcolumn = 'yes'

vim.opt.splitright = true

vim.opt.confirm = true

vim.colorcolumn = "50"

vim.o.scrolloff = 10

vim.opt.list = true

vim.opt.listchars = {
  lead = "·",
  trail = "·",
  nbsp = "␣"
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
    vim.lsp.buf.format({ async = false })
  end,
})
-- Telescope File Browser
--vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#252526" })
--vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#007ACC" })
--vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1E1E1E" })
--vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#373737", fg = "#FFFFFF" })
