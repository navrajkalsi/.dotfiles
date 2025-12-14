-- Clone github.com/folke/lazy.nvim.git to the following path
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  
	"nvim-lua/plenary.nvim",

	"Mofiqul/vscode.nvim",

  "nvim-telescope/telescope.nvim",

	"nvim-telescope/telescope-file-browser.nvim",

	"nvim-treesitter/nvim-treesitter",

	"theprimeagen/harpoon",

	"mbbill/undotree",

	"tpope/vim-fugitive",

  "williamboman/mason.nvim",

  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",

  "hrsh7th/nvim-cmp",

  "hrsh7th/cmp-buffer",

  "hrsh7th/cmp-path",

  "hrsh7th/cmp-nvim-lsp",

  "L3MON4D3/LuaSnip",
})
