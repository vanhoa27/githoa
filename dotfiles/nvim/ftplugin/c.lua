local keymap = vim.keymap.set

keymap("n", "<leader>cf", ":w<cr>:!gcc % -g -Wall -std=c11 -o %< <cr>")
keymap("n", "<leader>cc", ":w<cr>:!gcc % -g -Wall -Werror -std=c11 -fsanitize=address -o %< <cr>")
keymap("n", "<leader>cr", ":!./%<<cr>")

