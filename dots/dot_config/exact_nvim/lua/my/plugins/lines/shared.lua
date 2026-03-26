local utils = require("my.utils")

return {
    Space = { provider = " " },
    VLine = {
        provider = utils.symbol_guard("│", "|"),
        hl = { fg = "bright_fg" },
    },
    Align = { provider = "%=" },
}
