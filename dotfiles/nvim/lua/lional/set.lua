--[ [ ABBREVIATIONS ] ]
local opt = vim.opt
local g = vim.g

-- [ [ CONTEXT ] ]
opt.guicursor = ""
opt.nu = true
opt.rnu = true
opt.cul = true
opt.cc = "80"
opt.cursorlineopt = "both" -- number: hl-Nr, both: hl-Nr&cursor line
opt.conceallevel = 2 -- will conceal concealable text
opt.concealcursor = 'nc'
opt.mouse = "a"
opt.signcolumn = "yes"
opt.scrolloff = 2
opt.sidescrolloff = 0
opt.fillchars = { eob = "~" }
opt.lazyredraw = false

-- [[BACKUP]]
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undo Dir"
opt.undofile = true

-- [[FOLD METHOD]]
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "vim_tree sitter#folder()"

-- [ [ THEME ] ]
opt.syntax = "ON"
opt.termguicolors = true
opt.guifont = "Hack Nerd Font Mono h:16"
opt.pumheight = 10 -- pop-up menu height
opt.showmode = false

-- [ [ SPELLING ] ]

vim.cmd [[
    autocmd FileType md,tex setlocal spell
    set spelllang=de,en_us
    set spellsuggest=best
]]

opt.spelllang = "en,de"
opt.spellsuggest = "best"

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
opt.linebreak = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.wrap = false
opt.breakindentopt = { shift = 2 }

-- [ [ SEARCH ] ]
opt.hlsearch = true -- enable/disable highlightsearch
opt.errorbells = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.path:append({ "**" }) -- Finding Files -> search down into subfolder

-- [ [ COMPLETION ] ]
opt.wildignore:append({ "*/.git/*", "*/node_modules/*" }) --list of patterns to ignore files for file name completion
opt.wildmenu = true
opt.wildignorecase = true
opt.complete:append({ ".", "w", "b", "u", "t", "kspell" }) -- prioritize completion
opt.hidden = true
opt.omnifunc = "syntaxcomplete#Complete"

-- [ [ SPLITS ] ]
opt.splitright = true
opt.splitbelow = true

-- [ [ QUALITY OF LIFE CHANGES ] ]
opt.updatetime = 50
opt.cmdheight = 1

-- Mapleader
g.mapleadr = " "
g.localleader = " "

-- Vimtex
vim.g_vimtex_view_method = 'zathura'
vim.g_vimtex_quickfix_mode = 0

