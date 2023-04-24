local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = ({
    -- treesitter highlighting
    "nvim-treesitter/nvim-treesitter",

    "p00f/nvim-ts-rainbow",

    "lewis6991/impatient.nvim",

    -- colorschemes
    "folke/tokyonight.nvim",
    "projekt0n/github-nvim-theme",
    "Mofiqul/dracula.nvim",
    "ellisonleao/gruvbox.nvim",
    'nyoom-engineering/oxocarbon.nvim',
    "catppuccin/nvim",
    "lukas-reineke/onedark.nvim",
    "sainnhe/sonokai",
    "rose-pine/neovim",

    "windwp/nvim-autopairs",

    -- commentary
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- Snip    -- formatting & linting
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",

    -- Gitsigns && Git
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",

    -- TELESCOPE fzf
    ({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    }),

    "nvim-telescope/telescope-file-browser.nvim",

    -- Lua
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    -- lua function that many plugins use
    "nvim-lua/plenary.nvim",

    -- toggle Terminal in nvim
    "akinsho/toggleterm.nvim",

    -- Toolbar
    "nvim-lualine/lualine.nvim",

    -- Filexplorer
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "LunarVim/Colorschemes",

    -- Undotree
    "mbbill/undotree",

    -- bufferline
    ({ "akinsho/bufferline.nvim", tag = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" }),

    -- Zenmode && Twillight
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",

    -- Note taking
    "lervag/vimtex",
    ({
        "vimwiki/vimwiki",
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = "/home/vanhoa/Sync/Uni/vimwiki",
                    syntax = "markdown",
                    ext = ".md",
                },
            }
        end,
    }),

    "ElPiloto/telescope-vimwiki.nvim",

    -- markdown-preview
    ({
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    }),

    'github/copilot.vim',
    'ThePrimeagen/harpoon',
    'mfussenegger/nvim-jdtls',

    ({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                background_colour = "#000000",
            })
        end,

        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }),
})

require("lazy").setup(plugins)
