
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
-- vim.opt_local.cmdheight = 2 -- more space in the neovim command line for displaying messages

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local status, jdtls = pcall(require, "jdtls")
if not status then
    return
end

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("") == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "mac"
elseif vim.fn.has("unix") == 1 then
    WORKSPACE_PATH = home .. "/workspace/"
    CONFIG = "linux"
else
    print("Unsupported system")
end

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
    return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name

local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
        "\n"
    )
)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

        -- 💀
        "java", -- or '/path/to/java11_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        -- 💀
        "-jar",
        vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version

        -- 💀
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. CONFIG,
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.

        -- 💀
        -- See `data directory configuration` section in the README
        "-data",
        workspace_dir,
    },

    on_attach = require("cmp_nvim_lsp").on_attach,
    capabilities = capabilities,

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- or https://github.com/redhat-developer/vscode-java#supported-vs-code-settings
    -- for a list of options
    settings = {
        java = {
            -- jdt = {
            --   ls = {
            --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
            --   }
            -- },
            eclipse = {
                downloadSources = true,
            },
            -- configuration = {
            -- 	updateBuildConfiguration = "interactive",
            -- 	runtimes = {
            -- 		{
            -- 			name = "JavaSE-11",
            -- 			path = "~/.sdkman/candidates/java/11.0.2-open",
            -- 		},
            -- 		{
            -- 			name = "JavaSE-18",
            -- 			path = "~/.sdkman/candidates/java/18.0.1.1-open",
            -- 		},
            -- 	},
            -- },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all", -- literals, all, none
                },
            },
            format = {
                enabled = false,
                -- settings = {
                --   profile = "asdf"
                -- }
            },
        },
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
        },
        contentProvider = { preferred = "fernflower" },
        extendedClientCapabilities = extendedClientCapabilities,
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
        },
    },

    flags = {
        allow_incremental_sync = true,
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        -- bundles = {},
        bundles = bundles,
    },
}

config["on_attach"] = function(client, bufnr)
    require("lsp-zero").on_attach(client, bufnr)
end

local keymap = vim.keymap.set

local opts = { remap = true, noremap = true, silent = true }


-- [[REFACATORING]]

-- Normal mode mappings
keymap("n", "<leader>lo", "<Cmd>lua require'jdtls'.organize_imports()<CR>") -- Organize Imports
keymap("n", "<leader>lv", "<Cmd>lua require('jdtls').extract_variable()<CR>") -- Extract Variable
keymap("n", "<leader>lc", "<Cmd>lua require('jdtls').extract_constant()<CR>") -- Extract Constant
keymap("n", "<leader>lt", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>") -- Test Method
keymap("n", "<leader>lT", "<Cmd>lua require'jdtls'.test_class()<CR>") --Test Class
keymap("n", "<leader>lu", "<Cmd>JdtUpdateConfig<CR>") -- "Update Config"

-- Visual mode mappings

keymap("v", "<leader>lv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>") -- "Extract Variable"
keymap("v", "<leader>lc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>") -- "Extract Constant"
keymap("v", "<leader>lm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>") -- Extract Method"

keymap("n", "<leader>cc", ":w<cr>:!javac % <cr>")
keymap("n", "<leader>cr", ":!java %<<cr>")
