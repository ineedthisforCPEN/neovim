local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local mason = require("mason")
local masonlsp = require("mason-lspconfig")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(env)
        -- Keymaps defined here only exist once an LSP server is attached to
        -- a buffer.
        local opts = { buffer = env.buf }

        vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gf", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    end,
})

mason.setup({
    automatic_installation = true,
    ensure_installed = {
        "lua_ls",
    },
    ui = {
        border = "none",
        icons = {
            package_installed = "●",
            package_pending = "◐",
            package_uninstalled = "○",
        },
        keymaps = {
            ancel_installation = "<C-c>",
            check_outdated_packages = "c",
            check_package_version = "C",
            install_package = "i",
            toggle_package_expand = "<CR>",
            uninstall_package = "x",
            update_package = "u",
            update_all_packages = "U",
        },
    },
})

masonlsp.setup_handlers({
    -- Default server setup.
    function (server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,

    -- Any LSP-server-specific setup goes below the default handler.
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilites = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
})

