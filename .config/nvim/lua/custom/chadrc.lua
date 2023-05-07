---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"


M.ui = {
  hl_override = highlights.override,
  hl_add = highlights.add,
  theme = "tokyodark",
  theme_toggle = {"tokyodark","everblush"},
  telescope = {
   style = "bordered"
  },
  statusline = {
    theme = "minimal",
    separator_style = "default",
  },
  nvdash = {
    load_on_startup = true
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
