local opt = vim.opt
local g = vim.g

-- [[TRANSPARENT BACKGROUND]]
require("rose-pine").setup({
	disable_background = false,
})
require("tokyonight").setup({
	transparent = false,
})
require("dracula").setup({
	transparent_bg = false,
})
require("catppuccin").setup({
	transparent_background = false,
})
require("gruvbox").setup({
	transparent_mode = false,
})

-- [[BAGROUND]]
opt.background = "dark"

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	-- vim.api.nvim_set_hl(0, "Normalfloat", { bg = "None" })
end

ColorMyPencils("oxocarbon")

g.italic_comments = true -- italic comments(Default: true)
g.italic_keywords = true -- italic keywords(Default: true)
g.italic_functions = true -- italic functions(Default: false)
g.italic_variables = true -- italic variables(Default: false)
