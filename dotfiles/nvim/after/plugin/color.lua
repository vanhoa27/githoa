local opt = vim.opt
local g = vim.g

-- [[TRANSPARENT BACKGROUND]]
require("rose-pine").setup({
	disable_background = true,
})
require("tokyonight").setup({
	transparent = true,
})
require("dracula").setup({
	transparent_bg = true,
})
require("catppuccin").setup({
	transparent_background = true,
})
require("gruvbox").setup({
	transparent_mode = true,
})

-- [[BAGROUND]]
opt.background = "dark"

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "Normalfloat", { bg = "None" })
end

ColorMyPencils("tokyonight-moon")

g.italic_comments = true -- italic comments(Default: true)
g.italic_keywords = true -- italic keywords(Default: true)
g.italic_functions = true -- italic functions(Default: false)
g.italic_variables = true -- italic variables(Default: false)
