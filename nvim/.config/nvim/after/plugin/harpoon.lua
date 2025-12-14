local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local map = vim.keymap.set

map('n', '<leader>a', mark.add_file)
map('n', '<leader>h', ui.toggle_quick_menu)

map('n', '<C-q>', function() ui.nav_file(1) end)
map('n', '<C-w>', function() ui.nav_file(2) end)
map('n', '<C-e>', function() ui.nav_file(3) end)
map('n', '<C-r>', function() ui.nav_file(4) end)
