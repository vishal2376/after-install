local opt = vim.opt

-- Indenting
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Numbers
opt.relativenumber = true

-- Font
opt.guifont = "JetBrainsMono Nerd Font:h15"

-- Neovide Settings
if vim.g.neovide then
    -- vim.g.neovide_transparency = 0.9
    vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- NvimTree Config
local function open_nvim_tree()
    require("nvim-tree.api").tree.toggle({ focus = true })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
