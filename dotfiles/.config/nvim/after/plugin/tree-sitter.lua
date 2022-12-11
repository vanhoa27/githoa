local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

require("orgmode").setup_ts_grammar()

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	require("nvim-treesitter.configs").setup({
		highlight = {
			-- ...
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
		disable = {},
	},
	ensure_installed = {
		"json",
		"yaml",
		"css",
		"html",
		"lua",
		"python",
		"c",
		"java",
	},
	autotag = {
		enable = true,
	},
})

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
