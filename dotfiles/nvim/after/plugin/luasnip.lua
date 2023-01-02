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

    -- expand or jump snippet (try out jk)
    vim.keymap.set({"i", "s"}, "<c-f>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true}),

    -- jump backwards
    vim.keymap.set({"i", "s"}, "<c-v>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true}),

    -- -- list snippets
    -- vim.keymap.set("i", "<c-l>", function()
    --     if ls.choice_active() then
    --         ls.change_choice(1)
    --     end
    -- end),


	-- Autotrigger Snippets:
	enable_autosnippets = true,

    -- Use Tab to trigger Visual Selection
    store_selection_keys = "<Tab>",

    -- Event on which to check for exiting a snippet's region
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave',
})


require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
vim.keymap.set('n','<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})<CR>')

