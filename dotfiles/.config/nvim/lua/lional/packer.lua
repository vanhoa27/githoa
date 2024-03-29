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

	-- treesitter highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow") -- rainbow brackets, extension to treesitter

	-- perfomance booster(faster runtime)
	use("lewis6991/impatient.nvim")

	-- colorschemes
	use("folke/tokyonight.nvim")
	use("Mofiqul/dracula.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("catppuccin/nvim")
	use("lukas-reineke/onedark.nvim")
	use("sainnhe/sonokai")
	use("rose-pine/neovim")

	-- autocompletion (RIP Conqueror of Completion)
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("windwp/nvim-autopairs") --automatically closes brackets

	-- commentary
	use("tpope/vim-commentary") --For Commenting gcc & gc
	use("tpope/vim-surround") --Surrounding ysw)
    use("tpope/vim-repeat") -- vim repeat

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) -- snippet engine
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

	-- Gitsigns && Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- TELESCOPE fzf
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- lua function that many plugins use
	use("nvim-lua/plenary.nvim")

	-- toggle Terminal in nvim
	use("akinsho/toggleterm.nvim")

	-- Toolbar
	use("nvim-lualine/lualine.nvim")

	-- Filexplorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("LunarVim/Colorschemes")

	-- Undotree
	use("mbbill/undotree")

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Zenmode && Twillight
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")

	-- indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

    -- Note taking
    use("lervag/vimtex")
    use({
        "vimwiki/vimwiki",
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = "/home/vanhoa/Reposetories/githoa/sync2/vimwiki",
                    syntax = "markdown",
                    ext = ".md",
                },
            }
        end,
    })
    -- markdown-preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- markdown tables
    use({"dhruvasagar/vim-table-mode"})
end)
