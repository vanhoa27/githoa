local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup({
	ensure_installed = { "markdown", "c", "lua", "rust", "python", "java", "org" }, -- write all insted of {""} to maintain all
	sync_install = false,
	auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { " " }, -- list of languages that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { " " } },

	--  [ [ TS_RAINBOW PLUGIN ] ]
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
})
-- VIMTREE --> fold EXPRESSION

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
---WORKAROUND

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

---ENDWORKAROUND
