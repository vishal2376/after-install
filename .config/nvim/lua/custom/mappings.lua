local M = {}

M.general = {
    n = {
        -- : shortcut
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        -- toggle transparency
        ["<leader>tt"] = {
            function ()
                require("base46").toggle_transparency()
            end
        },

        -- move line up/down
        ["<C-S-Up>"] = {"dd2kp"},
        ["<C-S-Down>"] = {"ddp"},

        -- rename all words
        ["<leader>rw"] = {":%s/\\<<C-r><C-w>\\>//g<Left><Left>"},
    },

    i = {
        -- delete word
        ["<C-BS>"] = {"<ESC> dbi"},

        -- move line up/down
        ["<C-S-Up>"] = {"<ESC>dd2kp"},
        ["<C-S-Down>"] = {"<ESC>ddp"},
    },

    v = {
        -- add symbols ()""{} around selection
        ["\""] = {"c\"<C-r>\"\"",opts = { nowait = true }},
        ["{"] = {"c{<C-r>\"}",opts = { nowait = true }},
        ["("] = {"c(<C-r>\")",opts = { nowait = true }},
    }
}
--- more keybinds!

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        }
    }
}

M.nvterm = {
    plugin = true,

    t = {
        -- toggle in terminal mode
        ["<leader>ii"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<C-s>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<leader>vv"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },
    },

    n = {
        -- toggle in normal mode
        ["<leader>i"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<leader>h"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<leader>v"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },

        -- new

        ["<A-h>"] = {
            function()
                require("nvterm.terminal").new "horizontal"
            end,
            "new horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").new "vertical"
            end,
            "new vertical term",
        },
    },
}

return M

