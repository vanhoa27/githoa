local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 85,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
    terminal_mappings = true,
	persist_size = true,
	direction = "float", -- float
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "rounded",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "dracula",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	-- vim.api.nvim_buf_set_keymap(0, 't', '<jk>', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	-- vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end

local repl_project_root = "~/Repos/clojure-tut/"
local repl = Terminal:new({ cmd = "lein repl", hidden = true, dir = repl_project_root })

function _REPL_TOGGLE()
    repl_project_root = vim.fn.input("Project directroy: ")
    repl:toggle()
end

vim.keymap.set("n", "<leader>tr", "<cmd>lua _REPL_TOGGLE()<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>")
vim.keymap.set("n", "<leader>tm", "<cmd>lua _HTOP_TOGGLE()<CR>")


function _TEST_THIS()
    vim.fn.input("Project directroy: ")
end
