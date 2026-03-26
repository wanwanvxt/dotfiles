return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local utils = require("my.utils")

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
            for name, cmd in pairs(servers) do
                if utils.is_executable(cmd) then
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
    },
}
