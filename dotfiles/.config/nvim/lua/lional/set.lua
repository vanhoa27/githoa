--[ [ ABBREVATIONS ] ]
local opt = vim.opt
local g = vim.g

-- [ [ CONTEXT ] ]
opt.nu = true
opt.rnu = true
opt.cul = true
opt.cursorlineopt = "both" -- number: hl-nr, both: hl-nr&cursorline
opt.conceallevel = 2 -- will conceal conceallable text
opt.mouse = "a"
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.fillchars = { eob = "~" }
opt.colorcolumn = "0"
opt.lazyredraw = true

-- vim.cmd("set whichwrap+=<,>,[,],h,l")

-- [[BACKUP]]
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- [[FOLDMETHOD]]
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("set nofoldenable")

-- [ [ THEME ] ]
opt.syntax = "ON"
opt.termguicolors = true
opt.guifont = "Hack Nerd Font Mono h:16"
opt.pumheight = 10 -- pop-up menu height
opt.showmode = false

-- [ [ SPELLING ] ]
-- opt.spell = true
opt.spelllang = "en,de"
opt.spellsuggest = "best"

function SpellToggle()
	if vim.opt.spell:get() then
		vim.opt_local.spell = false
		vim.opt_local.spelllang = "en"
	else
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en_us", "de" }
	end
end

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
opt.showbreak = "↳" -- character for line break
-- opt.linebreak = true -- wrap in a new line

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
