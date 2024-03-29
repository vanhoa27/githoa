local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

--remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","
keymap("i", "<m-bs>", "<c-w>", opts)

-- [[Toggle line numbers]]
function _TOGGLE_LINENUMBERS()
    local number_state = vim.wo.number

    if number_state == true then
        vim.wo.number = false
        vim.wo.rnu = false
    else
        vim.wo.number = true
        vim.wo.rnu = true
    end
end

keymap("n", "<F6>", "<cmd>lua _TOGGLE_LINENUMBERS()<CR>", opts)

keymap("i", "<c-l>", "<right>", opts) -- backspace and <c-h> delete a whole word
keymap("i", "<c-h>", "<c-w>", opts) -- backspace and <c-h> delete a whole word
keymap("n", "<s-l>", "$", opts)
keymap("n", "<s-h>", "^", opts)
keymap("n", "Q", "<nop>", opts) -- unmap Q

-- [[buffers]]
keymap("n", "<leader>bn", ":bn<cr>", opts) -- go to next buffer
keymap("n", "<leader>bp", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bb", ":bp<cr>", opts) -- go to previous buffer
keymap("n", "<leader>bw", ":bw<cr>", opts) -- wipe out current buffer

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
keymap("n", "<leader>e", ":Neotree toggle left reveal_force_cwd<cr>", opts)
-- keymap("n", "<leader><leader>", ":Neotree toggle left reveal_force_cwd<cr>", opts)

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
keymap("n", "J", "mzJ`z", opts)

-- [[PLUGINS]]
keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)
keymap("n", "<leader>gs", ":Git<cr>", opts)
keymap("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", opts)

-- [[QUICKFIX MENU]]
keymap("n", "<C-n>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-p>", "<cmd>cprev<CR>zz", opts)

keymap("n", "<leader>j", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lprev<CR>zz", opts)

vim.keymap.set("n", "<leader>cr", ":!./%<cr>", opts)
