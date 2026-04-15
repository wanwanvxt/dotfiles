local M = {}

function M.is_tty()
    local term = os.getenv("TERM")
    if vim.fn.has("gui_running") == 0 and term == "linux" then
        return true
    end
    return false
end

function M.symbol_guard(a, b)
    return not vim.g.is_tty and a or b
end

function M.mkdir(dir)
    local res = vim.fn.isdirectory(dir)
    if res == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

function M.is_executable(name)
    return vim.fn.executable(name) > 0
end

function M.gh(repo)
    return 'https://github.com/' .. repo
end

function M.pack_add(arg)
    vim.g.pack_installing = true
    vim.pack.add(arg)
    vim.g.pack_installing = false
end

return M
