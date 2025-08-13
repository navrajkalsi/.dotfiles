function ColorPencils(color)
  color = color or 'vscode'

  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.o.background = 'dark'

  require('vscode').setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Apply theme colors to terminal
    terminal_colors = true,

  }
  )

  vim.cmd.colorscheme(color)
end

ColorPencils('vscode')
