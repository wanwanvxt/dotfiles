return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        if not vim.g.is_tty then
            vim.cmd.colorscheme("kanagawa-dragon")
        end
    end
}
