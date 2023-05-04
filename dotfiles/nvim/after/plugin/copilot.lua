-- use to enable disable filetypes
vim.g.copilot_filetypes = { ["*"]= true, java = true, python = true, C = true}
vim.keymap.set("n", "<M-CR>", ":Copilot panel<CR>", {noremap = true, silent = true})

-- copilot tabmap disable
-- vim.g.copilot_no_tab_map = true
-- vim.cmd[[imap <silent><script><expr> <C-CR> copilot#Accept("\<CR>")]]

-- Cycle to next suggestion
-- <M-]>
-- Cycle to previous suggestion
-- <M-[>
-- Dismiss current suggestion 
-- <C-]>



