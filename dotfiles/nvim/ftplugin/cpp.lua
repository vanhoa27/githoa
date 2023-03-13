local keymap = vim.keymap.set

keymap("n", "<leader>cf", ":w<cr>:!g++ % -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result -o %< <cr>")
keymap("n", "<leader>cc", ":w<cr>:!g++ % -std=c++17 -Wshadow -Wall -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG -o %< <cr>")
keymap("n", "<leader>r", ":!./%<<cr>")
