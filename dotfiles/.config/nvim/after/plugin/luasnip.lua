-----------------------
-- BECOME THE VIMTEX -
----------------------

if vim.g.snippets == "luasnip" then
	return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,

	-- dynamic snippets update as you type
	updateevents = "TextChanged, TextChangedI",

	-- Autosnippets:
	enable_autosnippets = true,

	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "", "Error" } },
			},
		},
	},
})

-----------------
-- [[LUASNIP]] --
-----------------
