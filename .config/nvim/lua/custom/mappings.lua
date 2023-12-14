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

         -- select lines
        ["<S-Up>"] = {"vk"},
        ["<S-Down>"] = {"vj"},

        -- move line up/down
        ["<C-S-Up>"] = {"dd2kp"},
        ["<C-S-Down>"] = {"ddp"},

        -- rename all words
        ["<leader>rw"] = {":%s/\\<<C-r><C-w>\\>//g<Left><Left>"},

        -- open gnome terminal
        ["<leader>b"] = {"<cmd> !gnome-terminal --working-directory=$(pwd) & <CR> <CR>"},

        -- open/save last session
        ["<F2>"]  = {"<cmd> source ~/.vim_session <CR>" ,"Load Session"},
        ["<F3>"]  = {"<cmd> mksession! ~/.vim_session <CR>" ,"Save session"},
    },

    i = {


        -- delete word
        ["<C-BS>"] = {"<ESC> dbi"},

        -- move line up/down
        ["<C-S-Up>"] = {"<ESC>dd2kp"},
        ["<C-S-Down>"] = {"<ESC>ddp"},

        -- select lines
        ["<S-Up>"] = {"<ESC> vk"},
        ["<S-Down>"] = {"<ESC> vj"},
    },

    v = {
        -- add symbols ()""{} around selection
        ["\""] = {"c\"<C-r>\"\"",opts = { nowait = true }},
        ["{"] = {"c{<C-r>\"}",opts = { nowait = true }},
        ["("] = {"c(<C-r>\")",opts = { nowait = true }},

        -- delete selected lines
        ["<BS>"] = {"c",opts = {nowait = true}}
    }
}

M.projects = {
  n = {
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects"}
    },
}

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

        ["<leader>hh"] = {
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

