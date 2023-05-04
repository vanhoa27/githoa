local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	require("nvim-treesitter.configs").setup({
		highlight = {
            enable = true,
            disable = {" "}, -- all disabled languages
            additional_vim_regex_highlighting = true,
		},
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" },
			extended_mode = true,
			max_file_lines = nil,
			-- colors = {},
			-- termcolors = {}
		},
	}),
	indent = {
		enable = true,
		disable = {" "},
	},
	ensure_installed = {
        "markdown",
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"python",
		"c",
		"java",
	},
    sync_install = false,
    auto_install = true,
    ignore_install = {""},
	autotag = {
		enable = true,
	},
})


-- VIMTREE --> fold EXPRESSION

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
---WORKAROUND

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

---ENDWORKAROUND

