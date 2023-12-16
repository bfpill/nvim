---- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
---- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')
--
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- Packer can manage itself
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  "folke/trouble.nvim",
	  config = function()
	  require("trouble").setup({
	  icons = true,
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	  })
	  end
	  })

use({
    'cranberry-clockworks/coal.nvim',
    config = function()
        require('coal').setup()
    end
})

use 'nvim-tree/nvim-tree.lua'
use 'nvim-tree/nvim-web-devicons'

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
}

use{
	'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
			end,
}

use("nvim-treesitter/playground")
use("theprimeagen/harpoon")
use("theprimeagen/refactoring.nvim")
use("mbbill/undotree")
use("tpope/vim-fugitive")
      use {
          'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},
--
--		  -- Autocompletion
    	  {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
--
		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

end)

