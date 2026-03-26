return {
    lua_ls = {
        cmd = { "lua-language-server" },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        },
    },
    clangd = { cmd = { "clangd" } },
    qmlls = { cmd = { "qmlls6" } },
    ols = { cmd = { "ols" } },
}
