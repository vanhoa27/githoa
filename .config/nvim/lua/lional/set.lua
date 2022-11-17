--[ [ ABBREVATIONS ] ]
local opt = vim.opt --to make it concise
local g = vim.g --:%s/<word>/<replacement>

-- [ [ CONTEXT ] ]
opt.nu = true
opt.rnu = true
vim.cmd("set nocul")
opt.mouse = ""
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cul = true -- enable cursorline
opt.wrap = true -- line wrap
-- opt.colorcolumn = "80"

-- [ [ THEME ] ]
opt.syntax = "ON"
opt.termguicolors = true
opt.guifont = "monospace:h17"
opt.pumheight = 10 -- pop-up menu height
opt.spelllang = "en"

-- [ [ WHITESPACE ] ]
opt.numberwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.wrap = false

-- [ [ Indentation ] ]
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true
opt.backspace = "start,eol,indent"

-- [ [ SEARCH ] ]
opt.hlsearch = false
opt.errorbells = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" }) --Finding Files -> search down into subfolder

-- [ [ SPLITS ] ]
opt.splitright = true
opt.splitbelow = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- Give more space for displaying messages.
opt.cmdheight = 1

opt.iskeyword:append("-") --considers dash ("-") as part of word
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- set to Systemclipboard
-- opt.clipboard:append("unnamedplus")

g.mapleadr = " "
g.localleader = " "

-- Netrw Explorer
g.netrw_banner = "0" -- Disables the banner
g.netrw_liststyle = "3" -- Tree view
-- set editor transparent
-- highlight Normal guibg=none
