local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

--remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("i", "<m-bs>", "<c-w>", opts)

keymap("i", "<c-L>", "<Esc>A", opts) -- backspace and <c-h> delete a whole word
keymap("i", "<c-h>", "<c-w>", opts) -- backspace and <c-h> delete a whole word
keymap("n", "<s-l>", "$", opts)
keymap("n", "<s-h>", "^", opts)
keymap("n", "Q", "<nop>", opts) -- unmap Q

-- [[buffers]]
keymap("n", "<leader>bn", ":bn<cr>", opts) -- go to next buffer
keymap("n", "<leader>bp", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bb", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bw", ":bw<cr>", opts) -- wipe out current buffer

-- tabs
keymap("n", "<leader>te", ":tabnew<cr>", opts) --open a new tab --tabedit and tabnew are similiar
keymap("n", "<leader>tc", ":tabclose<cr>", opts) --close current tab

-- paste/hightlight/yank
keymap("n", "x", '"_x', opts) -- do not yank with x
keymap("n", "X", '"_X', opts) -- do not yank with x

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], opts)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

keymap("x", "<leader>p", [["_dP]], opts)

keymap("n", "<leader>h", ":noh<cr>", opts) --clear all hightlighting until next search

-- buffers
keymap("n", "<leader>fb", ":telescope buffers<cr>", opts) -- lists open buffers
keymap("n", "<leader>bk", ":bw!<cr>", opts) -- kills current buffer

-- open explorer
-- open in relative path
keymap("n", "<leader><leader>", ":Neotree toggle %:p:h:h float reveal_force_cwd<cr>", opts)
keymap("n", "<leader>e", ":Neotree toggle left reveal_force_cwd<cr>", opts)

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
-- keymap("n", "<leader>x", "<cmd>!chmod +x %<cr>", opts)
keymap("n", "J", "mzJ`z", opts)

-- [[PLUGINS]]
keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)
keymap("n", "<leader>gs", ":Git<cr>", opts)
keymap("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", opts)

-- [[QUICKFIX MENU]]
keymap("n", "<C-n>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-p>", "<cmd>cprev<CR>zz", opts)

keymap("n", "<leader>n", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>p", "<cmd>lprev<CR>zz", opts)

keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)

vim.keymap.set("n", "<leader>cr", ":!./%<cr>", opts)
