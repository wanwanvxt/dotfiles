local utils = require("my.utils")

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = true,
    cmd = "Neotree",
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "toggle neo-tree" }
    },
    opts = {
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = false,
        enable_diagnostics = false,
        sort_case_insensitive = true,
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1,
                with_markers = not vim.g.is_tty,
                indent_marker = "│",
                last_indent_marker = "└",
                with_expanders = true,
                expander_collapsed = utils.symbol_guard("", "[+]"),
                expander_expanded = utils.symbol_guard("", "[-]"),
            },
            icon = {
                folder_closed = utils.symbol_guard("", ""),
                folder_open = utils.symbol_guard("", ""),
                folder_empty = utils.symbol_guard("", ""),
                provider = function(icon, node, state)
                    if vim.g.is_tty then
                        icon.text = ""
                    else
                        local ic, hl = require("nvim-web-devicons").get_icon(node.name)
                        icon.text = ic or icon.text
                        icon.highlight = hl or icon.highlight
                    end
                end,
                default = utils.symbol_guard("󰈔", ""),
            },
            modified = {
                symbol = utils.symbol_guard("", "[+]"),
            },
            file_size = { enabled = true },
            type = { enabled = true },
            last_modified = { enabled = false },
            created = { enabled = false },
            symlink_target = { enabled = true },
        },
        window = { position = "float" },
        filesystem = {
            filtered_items = {
                visible = false,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_ignored = true,
                hide_by_name = { ".git", "node_modules", ".yolk_git", ".deployed_cache" },
            },
            follow_current_file = { enabled = true },
        },
        buffers = {
            follow_current_file = { enabled = true },
        },
    },
}
