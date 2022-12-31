local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

--remap space as leader key
keymap("n", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("i", "<m-bs>", "<c-w>", opts)

-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- compile and run code
keymap("n", "<f6>", ":!gcc % -g -Wall -std=c11 -o %< && ./%< <cr>", opts)
keymap("n", "<f8>", ":!gcc % -g -Wall -std=c11 -o %< <cr>", opts)

-- better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- [[buffers]]
keymap("n", "<leader>bn", ":bn<cr>", opts) -- go to next buffer
keymap("n", "<leader>bp", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bb", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bw", ":bw<cr>", opts) -- wipe out current buffer

-- tabs
keymap("n", "<leader>te", ":tabnew<cr>", opts) --open a new tab --tabedit and tabnew are similiar
keymap("n", "<leader>tc", ":tabclose<cr>", opts) --close current tab
keymap("n", "<m-l>", "<cmd>BufferLineCycleNext<cr>", opts) --scroll forward
keymap("n", "<m-h>", "<cmd>BufferLineCyclePrev<cr>", opts) --scroll backward

-- paste/hightlight/yank
keymap("n", "x", '"_x', opts) -- do not yank with x
keymap("n", "db", 'vb"_d', opts) -- delete a word backwards (includes selected char)
keymap("n", "<leader>y", '"+y', opts) -- yank into system clipboard
keymap("v", "<leader>y", '"+y', opts) -- same but in visual_mode
keymap("n", "<leader>p", '"+p', opts) -- paste from clipboard
keymap("n", "<leader>P", '"+P', opts) -- paste from clipboard
keymap("v", "<leader>p", '"+p', opts)
keymap("n", "<leader>a", "gg<s-v>g", opts) --higlight all
keymap("n", "<leader>h", ":noh<cr>", opts) --clear all hightlighting until next search

-- split window (german-mode)
keymap("n", "<leader>wv", ":vsplit<cr>", opts) --vertical split
keymap("n", "<leader>ws", ":split<cr>", opts) --horizontal split
keymap("n", "<leader>wc", ":close<cr>", opts) -- close current split
keymap("n", "<leader>wo", "<c-w><c-o>", opts) -- close all splits

-- buffers
keymap("n", "<leader>fb", ":telescope buffers<cr>", opts) -- lists open buffers
keymap("n", "<leader>bk", ":bw<cr>", opts) -- kills current buffer

-- open explorer
keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts) --netrw disabled, if enabled: <:lex 25>

-- quit and save like a normie
keymap("n", "<c-q>", ":q<cr>", opts) -- ctrl q to exit
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<c-s>", ":w<cr>", opts) -- ctrl s to save

--increment
keymap("n", "+", "<c-a>", opts) --increment
keymap("n", "-", "<c-x>", opts) --decrement

-- visual
keymap("n", "<c-up>", ":resize -2<cr>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("x", "<m-j>", ":m '>+1<cr>gv=gv", opts)
keymap("n", "<m-j>", ":m .+1<cr>==", opts)
keymap("x", "<m-k>", ":m '<lt>-2<cr>gv=gv", opts)
keymap("n", "<m-k>", ":m .-2<cr>==", opts)

-- [[NAVIGATION]]
keymap("n", "<c-u>", "<c-u>zz", opts)
keymap("n", "<c-d>", "<c-d>zz", opts)

-- [[THEPRIMEAGEN]]
vim.keymap.set("n", "<leader>s", ":%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gi<left><left><left>")
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<cr>", opts)
keymap("n", "J", "mzJ`z", opts)

-- [[PLUGINS]]
keymap("n", "<leader>u", ":undotreetoggle<cr>", opts)
keymap("n", "<leader>gs", ":Git<cr>", opts)
keymap("i", "<c-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
keymap("n", "<leader>lm", ":MarkdownPreviewToggle<cr>", opts)
