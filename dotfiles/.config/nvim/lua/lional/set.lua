--[ [ ABBREVATIONS ] ]
local opt = vim.opt --to make it concise
local g = vim.g --:%s/<word>/<replacement>

-- [ [ CONTEXT ] ]
opt.nu = true
opt.rnu = true
opt.cul = false -- disable/enable cursorline
opt.mouse = "a"
opt.signcolumn = "yes"
-- opt.colorcolumn = "80"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = true -- line wrap
vim.cmd("set whichwrap+=<,>,[,],h,l")
opt.linebreak = false -- wrap in a new line

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

-- [ [ Indentation ] ]
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true -- preserve indentation in wraped text
opt.breakindentopt = { shift = 2 }
opt.showbreak = "↳" -- character for line break
opt.backspace = "start,eol,indent"

-- [ [ SEARCH ] ]
opt.hlsearch = true -- enable/disable highlightsearch
opt.errorbells = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" }) -- Finding Files -> search down into subfolder

-- [ [ COMPLETION ] ]
opt.wildignore:append({ "*/.git/*", "*/node_modules/*" }) --list of patterns to ignore files for file name completion
opt.wildmenu = true --command-line completion shows a list of matches (not very useful with lsp on)
opt.wildignorecase = true --ignore case when completing files names
-- opt.wildmode = "list:longest,list:full" -- for <cmd> search
opt.complete:append({ ".", "w", "b", "u", "t", "kspell" }) -- prioritize completion
opt.hidden = true

-- [ [ SPLITS ] ]
opt.splitright = true
opt.splitbelow = true

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.

-- [ [ QUALITY OF LIFE CHANGES ] ]
opt.updatetime = 50
opt.cmdheight = 1
opt.iskeyword:append("-") --considers dash ("-") as part of word

-- set to Systemclipboard
-- opt.clipboard:append("unnamedplus")

-- Mapleader
g.mapleadr = " "
g.localleader = " "

-- Netrw Explorer
g.netrw_banner = "0" -- Disables the banner
g.netrw_liststyle = "3" -- Tree view
