vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Project view
map("n", "<leader>pv", ":Telescope file_browser path=%:p:h select_buffer=false<CR>", opts)
map("n", "<C-c>", ":q<CR>", opts)

-- Copying & pasing
map({ "n", "v" }, "<leader>y", [["+y]], opts)
map({ "n", "v" }, "<leader>p", [["+p]], opts)

-- Line moving while in visual
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Centering after moving
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map("n", "<leader>f", vim.lsp.buf.format, opts)
