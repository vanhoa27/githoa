local opt = vim.opt
local g = vim.g

local colorscheme = "sonokai"

-- added colorschemes: gruvbox, tokyonight, dracula, nightfly, onedarker

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

opt.background = "dark"

g.tokyonight_style = "night"
g.tokyonight_italic_functions = true
g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true

g.transparent_background = false -- transparent background(Default: false)
g.italic_comments = true -- italic comments(Default: true)
g.italic_keywords = true -- italic keywords(Default: true)
g.italic_functions = true -- italic functions(Default: false)
g.italic_variables = true -- italic variables(Default: false)
