---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "catppuccin", -- default theme
    transparency = false,

    telescope = { style = "bordered" }, -- borderless / bordered

    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
    }
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
