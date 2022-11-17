local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- TABS
keymap("n", "te", ":tabnew<CR>", opts) --open a new tab --tabedit and tabnew are similiar
keymap("n", "tx", ":tabclose<CR>", opts) --close current tab
keymap("n", "tl", ":tabn<CR>", opts) --so to previous tab
keymap("n", "th", ":tabprevious<CR>", opts) --go to next tab
-- keymap("n","<C-c>",'"+y',opts) --copy into system clipboard

-- Paste/hightlight/yank
keymap("n", "x", '"_x', opts) -- Do not yank with x
keymap("n", "db", 'vb"_d', opts) -- Delete a word backwards (includes selected char)
keymap("n", "<C-a>", "gg<S-v>G", opts) --higlight all

-- Split window
keymap("n", "<leader>vs", ":vsplit<CR>", opts) --vertical split
keymap("n", "<leader>ss", ":split<CR>", opts) --horizontal split
keymap("n", "<leader>so", "<C-w>o", opts) -- close all splits
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split
-- keymap("n","<leader>so",)

-- Resize split window

-- open Explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) --netrw disabled, if enabled: <:Lex 25>

-- Filemanangemant
keymap("n", "<C-q>", ":q<CR>", opts) -- ctrl q to exit
keymap("n", "<C-s>", ":w<CR>", opts) -- ctrl s to save

keymap("n", "+", "<C-a>", opts) --increment
keymap("n", "-", "<C-x>", opts) --decrement

-- Visual --
keymap("n", "<C-Up>", ":resize +19<CR>", opts)
keymap("n", "<C-Down>", ":resize 15<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize 15<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +19<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m.+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m.-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+18<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<15<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+18<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<15<CR>gv-gv", opts)

-- keymap("v", "p", '"_dP', opts)
