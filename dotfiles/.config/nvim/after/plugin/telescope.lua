local status, telescope = pcall(require, "telescope")
if not status then
	return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- no idea what it does exactly, but it improves fzfs search results
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.load_extension("file_browser")

telescope.setup({
	defaults = {

		layout_strategy = "horizontal",
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {

		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {},
})

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		-- previewer = false,
		hidden = true,
	})
end)
vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers({
		-- previewer = false,
		initial_mode = "insert",
	})
end)
vim.keymap.set("n", "<leader>fh", function()
	builtin.help_tags()
end)
vim.keymap.set("n", "<leader>fr", function()
	builtin.oldfiles()
end)
vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", "<leader>fR", function() -- Register
	builtin.registers()
end)
vim.keymap.set("n", "<leader>fG", function() -- Git-branches
	builtin.git_branches()
end)
vim.keymap.set("n", "<leader>fc", function() -- Git-branches
	builtin.git_commits()
end)
vim.keymap.set("n", "<leader>.", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		-- previewer = false,
		initial_mode = "insert",
		layout_config = { height = 40 },
	})
end)

-- -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- find files
-- -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- find word
-- -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- look for current open buffers
-- -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {}) -- search for help
-- -- vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {}) -- search for recently used files
-- -- vim.keymap.set("n", "<leader>fs", ":Telescope file_browser<CR>") -- browse through files in your current directory
