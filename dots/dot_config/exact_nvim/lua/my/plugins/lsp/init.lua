return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local utils = require("my.utils")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        vim.lsp.config("*", {
            capabilities = capabilities,
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = utils.symbol_guard("", "E"),
                    [vim.diagnostic.severity.WARN]  = utils.symbol_guard("", "W"),
                    [vim.diagnostic.severity.INFO]  = utils.symbol_guard("", "I"),
                    [vim.diagnostic.severity.HINT]  = utils.symbol_guard("", "H"),
                },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local bufnr = event.buf
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
            end
        })

        local servers = require("my.plugins.lsp.servers")
        for name, cfg in pairs(servers) do
            local cmd = cfg.cmd[1]
            if utils.is_executable(cmd) then
                vim.lsp.config(name, cfg)
                vim.lsp.enable(name)
            else
                local msg = string.format(
                    "Executable '%s' for server '%s' not found",
                    cmd,
                    name
                )
                vim.notify(msg, vim.log.levels.WARN, { title = "nvim-config" })
            end
        end
    end
}
