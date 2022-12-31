-----------------
-- [[LUASNIP]] --
-----------------

-- local variables for snippets
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local types = require("luasnip.util.types")

if vim.g.snippets == "luasnip" then
	return
end


ls.config.set_config({
	history = true,

	-- dynamic snippets update as you type
	updateevents = "TextChanged, TextChangedI",

	-- Autotrigger Snippets:
	enable_autosnippets = true,

    -- Use Tab to trigger Visual Selection
    store_selection_keys = "<Tab>",

    -- Event on which to check for exiting a snippet's region
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave',
})


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
vim.keymap.set('n','<Leader>rs', '<Cmd>lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})<CR>')

