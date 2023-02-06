require("lional")
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

-- Calcurse, enable Markdown
vim.cmd[[
    autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=vimwiki
    autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=vimwiki
]]


-- Disable Vimwiki outside of wiki pages
vim.g.vimwiki_global_ext = 1

-- Vimtex
