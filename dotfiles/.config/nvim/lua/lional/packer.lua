-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

--Automatically installs packer when opening up neovim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

vim.cmd([[packadd packer.nvim]])

-- Autocommand that reloads neovim whenever you save this file
-- Automatically Installs & Updates Plugins, Removes Old Plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Automatically tries to import Packer, if it doesn't find it --> fail, return
local status, packer = pcall(require, "packer")
if not status then
	print("Packer couldn't be found") --remove print if it causes error
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- [ [ PACKER_PLUGINS ] ]
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself, Plug-Installer
	use({
		"nvim-treesitter/nvim-treesitter", -- Syntax highlighting
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- rainbow brackets, extension to treesitter
	use("nvim-treesitter/nvim-treesitter-angular")

	-- perfomance booster(faster runtime)
	use("lewis6991/impatient.nvim")

	-- colorschemes
	use("folke/tokyonight.nvim") --colorscheme tokyonight
	use("gruvbox-community/gruvbox") -- colorscheme gruvbox
	use("Mofiqul/dracula.nvim") -- colorscheme dracula
	use("krivahtoo/nightfly.nvim") -- colorscheme nightfly
	use("catppuccin/nvim")

	-- autocompletion (RIP Conqueror of Completion)
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("windwp/nvim-autopairs") --automatically closes brackets
	-- use({ "neoclide/coc.nvim", branch = "release" }) --autocompletiion

	-- commentary
	use("tpope/vim-commentary") --For Commenting gcc & gc
	use("tpope/vim-surround") --Surrounding ysw)

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- Gitsigns
	use("lewis6991/gitsigns.nvim")

	-- TELESCOPE
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- fuzzyfinder telescope
	use("nvim-telescope/telescope-file-browser.nvim")

	-- lua function that many plugins use
	use("nvim-lua/plenary.nvim")

	-- toggle Terminal in nvim
	use("akinsho/toggleterm.nvim")

	-- Toolbar
	use("nvim-lualine/lualine.nvim") -- vim-airline successor

	--Filexplorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("LunarVim/Colorschemes")

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	})
end)

-- ou must run this or `packersync` whenever you make changes to your plugin configuration
-- regenerate compiled loader file
-- :packercompile

-- remove any disabled or unused plugins
-- :packerclean

-- clean, then install missing plugins
-- :packerinstall

-- clean, then update and install plugins
-- supports the `--preview` flag as an optional first argument to preview updates
-- :packerupdate

-- perform `packerupdate` and then `packercompile`
-- supports the `--preview` flag as an optional first argument to preview updates
-- :packersync

-- loads opt plugin immediately
-- :packerload completion-nvim ale
