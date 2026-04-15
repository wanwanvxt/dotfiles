local M = {}

function M.is_tty()
    return os.getenv("TERM") == "linux"
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

return M
