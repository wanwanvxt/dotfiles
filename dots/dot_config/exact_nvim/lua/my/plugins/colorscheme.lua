return {
    "rebelot/kanagawa.nvim",
    enabled = not vim.g.is_tty,
    lazy = false,
    priority = 1000,
    config = function()
        if not vim.g.is_tty then
            vim.cmd.colorscheme("kanagawa-dragon")
        end
    end
}
