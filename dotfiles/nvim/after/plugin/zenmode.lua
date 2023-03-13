local status, zen = pcall(require, "zen-mode")
if not status then
	return
end

zen.setup({
	window = {
		backdrop = 0.95,
		width = 120,
		height = 1,
		options = {
			signcolumn = "no", -- disable signcolumn
			number = false, -- disable number column
			relativenumber = false, -- disable relative numbers
			cursorline = false, -- disable cursorline
			-- cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			-- list = false, -- disable whitespace characters
		},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false,
			showcmd = false,
		},
		twilight = { enabled = true },
		gitsigns = { enabled = false },
		tmux = { enabled = false },
		alacritty = {
			enabled = true,
			font = "13",
		},
	},
	on_open = function(win) end,
	on_close = function() end,
})

vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
end)
