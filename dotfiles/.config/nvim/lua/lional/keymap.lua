local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

--remap space as leader key
keymap("n", "<space>", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<leader>;", ":Alpha<CR>", opts)

-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- doom emacs window navigation
keymap("n", "<leader>wh", "<c-w>h", opts)
keymap("n", "<leader>wj", "<c-w>j", opts)
keymap("n", "<leader>wk", "<c-w>k", opts)
keymap("n", "<leader>wl", "<c-w>l", opts)
keymap("n", "<leader>wl", "<c-w>l", opts)
keymap("n", "<leader>ww", "<c-w>w", opts) -- go not next window

-- [[BUFFERS]]
keymap("n", "<leader>bn", ":bn<CR>", opts) -- go to next buffer
keymap("n", "<leader>bp", ":bp<CR>", opts) -- go to previous buffer
keymap("n", "<leader>bw", ":bw<CR>", opts) -- wipe out current buffer

-- linting/formating/folding
keymap("n", "<leader>lw", ":loadview<CR>", opts)

-- tabs
keymap("n", "<leader>te", ":tabnew<cr>", opts) --open a new tab --tabedit and tabnew are similiar
keymap("n", "<leader>tc", ":tabclose<cr>", opts) --close current tab
-- keymap("n", "<tab>", "<cmd>bufferlinecyclenext<cr>", {}) --scroll forward
-- keymap("n", "<s-tab>", "<cmd>bufferlinecycleprev<cr>", {}) --scroll backward

-- paste/hightlight/yank
keymap("n", "x", '"_x', opts) -- do not yank with x
keymap("n", "db", 'vb"_d', opts) -- delete a word backwards (includes selected char)
keymap("n", "<leader>y", '"+y', opts) -- yank into system clipboard
keymap("v", "<leader>y", '"+y', opts) -- same but in visual_mode
keymap("n", "<leader>d", '"_d', opts) -- delete without copying into clipboard
keymap("v", "<leader>d", '"_d', opts) -- same but in visual_mode
keymap("n", "<leader>p", '"+p', opts) -- paste from clipboard
keymap("n", "<leader><leader>a", "gg<S-v>G", opts) --higlight all
keymap("n", "<leader>h", ":noh<cr>", opts) --clear all hightlighting until next search

-- split window
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
keymap("n", "<c-s>", ":w<cr>", opts) -- ctrl s to save

--increment
keymap("n", "+", "<c-a>", opts) --increment
keymap("n", "-", "<c-x>", opts) --decrement

-- visual --
keymap("n", "<c-up>", ":resize +19<cr>", opts)
keymap("n", "<c-down>", ":resize 15<cr>", opts)
keymap("n", "<c-left>", ":vertical resize 15<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +19<cr>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
