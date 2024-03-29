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

local themes = require("telescope.themes")

require 'telescope'.load_extension('projects')

telescope.load_extension("file_browser")

telescope.setup({
    defaults = {

        layout_strategy = "horizontal", -- horizontal, vertical, center, flex
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<ESC>"] = actions.close,
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

                ["<Tab>"] = actions.close,
                ["<S-Tab>"] = actions.close,

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
        hidden = true,
    })
end)
vim.keymap.set("n", "<leader>fg", function()
    builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fb", function()
    builtin.buffers({
        layout_strategy = "vertical",
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
    builtin.diagnostics({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fR", function()
    builtin.registers({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fG", function()
    builtin.git_branches()
end)
vim.keymap.set("n", "<leader>fc", function()
    builtin.git_commits()
end)
vim.keymap.set("n", "<leader>fC", function()
    builtin.colorscheme({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fs", function()
    builtin.lsp_document_symbols({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fk", function()
    builtin.keymaps({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fj", function()
    builtin.jumplist({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fT", function() -- filetype
    builtin.filetypes({
        layout_strategy = "center",
    })
end)
vim.keymap.set("n", "<leader>fe", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        -- previewer = false,
        initial_mode = "insert",
        layout_config = { height = 40 },
        layout_strategy = "vertical",
    })
end)

vim.keymap.set("n", "<leader>fp", function()
    telescope.extensions.projects.projects({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        hidden = true,
        grouped = true,
        layout_strategy = "center",
    })
end)

vim.keymap.set("n", "<leader>fM", function()
    builtin.man_pages({
        layout_strategy = "center",
    })
end)

vim.keymap.set("n", "<leader>;", function()
    builtin.commands({
        layout_strategy = "center",
    })
end)

