local lsp = require("lsp-zero")
local luasnip = require("luasnip")

-- LSP Saga
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    -- use enter to open file with definition preview
    definition = {
        edit = "<CR>",
    },
    ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
})


lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'clangd',
})

-- Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require('cmp')

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),

    ["<C-f>"] = cmp.mapping(function()
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            cmp.mapping.select_next_item()
        end
    end, { "i", "s" }),
    ["<C-v>"] = cmp.mapping(function()
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            cmp.mapping.select_prev_item()
        end
    end, { "i", "s" }),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    formatting = {
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- LSP Saga bindings
    vim.keymap.set({ "n", "v" }, "<leader>la", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)             -- show documentation for what is under cursor
    vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

    -- LSP Bindings
    vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', "<M-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    -- vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<space>lf', function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('<leader>lwa', vim.lsp.buf.add_workspace_folder, opts, "Add workspace folder")
    vim.keymap.set('<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts, "Remove workspace folder")
    vim.keymap.set('<leader>lwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts, "List workspace folders")
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
