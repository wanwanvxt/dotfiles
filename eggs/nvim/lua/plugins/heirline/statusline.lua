local utils = require("my.utils")
local hl_utils = require("heirline.utils")
local hl_conds = require("heirline.conditions")
local shared = require("plugins.heirline.shared")

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode()
    end,
    static = {
        mode_names = {
            n       = "NORMAL",
            v       = "VISUAL",
            V       = "VISUAL LINE",
            ["\22"] = "VISUAL BLOCK",
            s       = "SELECT",
            S       = "SELECT LINE",
            ["\19"] = "SELECT BLOCK",
            i       = "INSERT",
            R       = "REPLACE",
            c       = "COMMAND",
            r       = "PROMPT",
            ["!"]   = "SHELL",
            t       = "TERMINAL",
        },
        mode_colors = {
            n       = "green",
            v       = "cyan",
            V       = "cyan",
            ["\22"] = "cyan",
            s       = "purple",
            S       = "purple",
            ["\19"] = "purple",
            i       = "blue",
            R       = "red",
            c       = "orange",
            r       = "orange",
            ["!"]   = "green",
            t       = "green",
        },
    },
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
    provider = function(self)
        return string.format(" %s ", self.mode_names[self.mode])
    end,
    hl = function(self)
        return { bg = "bright_bg", fg = self.mode_colors[self.mode], bold = true }
    end,
}

local FilePath = {
    provider = function(self)
        local relpath = vim.fn.fnamemodify(self.filepath, ":.")
        if relpath == "" then return "[No name]" end

        local path = vim.fn.fnamemodify(relpath, ":~:.")
        local head, tail = "", path

        local env_vars = { "VIMRUNTIME" }
        for _, var in ipairs(env_vars) do
            local val = os.getenv(var)
            if val and val ~= "" then
                if path:sub(1, #val) == val then
                    head = "$" .. var
                    tail = path:sub(#val + 1)
                    break
                end
            end
        end

        if not hl_conds.width_percent_below(#head+#tail, 0.25) then
            return head .. vim.fn.pathshorten(tail)
        end

        return head .. tail
    end,
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = " [+]",
        hl = { fg = "yellow" }
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = " [RO]",
        hl = { fg = "red" },
    },
}

local FileType = {
    init = function(self)
        self.type = vim.bo.filetype
        if not self.type or self.type == "" then
            self.type = "unknown"
        end
    end,
    provider = function(self)
        return string.format("[%s]", self.type)
    end,
    hl = function()
        if hl_conds.is_active() then
            return { fg = "blue" }
        end
    end,
}

local FileEcoding = {
    init = function(self)
        self.enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
        self.fmt = vim.bo.fileformat
    end,
    provider = function(self)
        return string.format("[%s/%s]", self.enc, self.fmt)
    end,
    hl = function()
        if hl_conds.is_active() then
            return { fg = "green" }
        end
    end,
}

local FileBlock = {
    init = function(self)
        self.filepath = vim.api.nvim_buf_get_name(0) or ""
    end,
    {
        shared.Space,
        FilePath,
        FileFlags,
        shared.Space,
        FileType,
        shared.Space,
        FileEcoding,
        shared.Space,
    },
}

local LSPActive = {
    init = function(self)
        self.servers = {}
        for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
            table.insert(self.servers, server.name)
        end
    end,
    condition = hl_conds.lsp_attached,
    update = { "LspAttach", "LspDetach" },
    hl = { fg = "purple" },
    provider = function(self)
        return string.format(" [%s] ", table.concat(self.servers, " "))
    end,
}

local Diagnostics = {
    condition = hl_conds.has_diagnostics,
    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warns  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.infos  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        self.hints  = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    end,
    on_click = {
        name = "StatusLineDiagnosticsOnClick",
        callback = function()
            vim.diagnostic.setqflist()
        end,
    },
    update = { "DiagnosticChanged", "BufEnter" },
    {
        { provider = "[" },
        {
            provider = function(self)
                return string.format("E.%d", self.errors)
            end,
            hl = { fg = "diag_error" },
        },
        shared.Space,
        {
            provider = function(self)
                return string.format("W.%d", self.warns)
            end,
            hl = { fg = "diag_warn" },
        },
        shared.Space,
        {
            provider = function(self)
                return string.format("I.%d", self.infos+self.hints)
            end,
            hl = { fg = "diag_info" },
        },
        { provider = "]" },
    },
}

local Location = {
    provider = " %l/%L:%c ",
    hl = { bg = "bright_bg", fg = "green", bold = true },
}

---
local InactiveStatusLine = {
    condition = hl_conds.is_not_active,
    hl = { fg = "gray" },
    {
        FileBlock,
        shared.Align,
    },
}
local DefaultStatusLine = {
    hl = { fg = "white" },
    {
        ViMode,
        FileBlock,
        shared.Align,
        Diagnostics,
        LSPActive,
        Location,
    },
}

return {
    hl = function()
        return hl_conds.is_active() and "StatusLine" or "StatusLineNC"
    end,
    fallthrough = false,
    InactiveStatusLine,
    DefaultStatusLine,
}
