local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<leader>pf', builtin.find_files) -- project files
map('n', '<leader>pg', builtin.git_files) -- project git
map('n', '<leader>ps', builtin.live_grep) -- project search

-- file browser
require("telescope").setup({
  extensions = {
    file_browser = {
      git_status = false,
      hijack_netrw = true,
      mappings = {
        ["i"] = {
        },
        ["n"] = {
        },
      },
    },
  },
  defaults = {
    layout_config = {
      width = 0.8,
      height = 0.7,
      preview_cutoff = 20,
    },
    -- sorting_strategy = "ascending",
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }, -- VS Code style borders
  },
  pickers = {
    find_files = { theme = "dropdown" }, -- VS Code-like small popup
    live_grep = { theme = "ivy" },
  },
})

require("telescope").load_extension "file_browser"
