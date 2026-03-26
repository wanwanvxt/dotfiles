local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

local function get_plugins()
    local all = {}

    local dir = vim.fn.stdpath("config") .. "/lua/my/plugins"
    local children = vim.fn.readdir(dir)

    for _, child in ipairs(children) do
        local path = dir .. "/" .. child
        local is_dir = vim.fn.isdirectory(path) == 1
        local name = nil

        if not is_dir and child:sub(-4) == ".lua" and child ~= "init.lua" then
            name = child:gsub("%.lua$", "")
        elseif is_dir and vim.fn.filereadable(path .. "/init.lua") == 1 then
            name = child
        end

        if name then
            local ok, plugin = pcall(require, "my.plugins." .. name)
            if ok then
                table.insert(all, plugin)
            end
        end

    end

    return all
end

require("lazy").setup({
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",
    },
    rocks = {
        enabled = false,
        hererocks = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "tohtml", "netrw", "netrwPlugin",
                "zipPlugin", "gzip", "tarPlugin",
                "matchit", "matchparen",
            },
        },
    },
    spec = get_plugins(),
})
