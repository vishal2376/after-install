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
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_remember_window_size = true
end

-- NvimTree Config
-- local function open_nvim_tree()
    -- require("nvim-tree.api").tree.toggle({ focus = true })
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Run Python files
vim.api.nvim_exec([[
  autocmd FileType python command! RunPython !python3 %
  autocmd FileType python nnoremap <buffer> <F5> :RunPython<CR>

  autocmd FileType python command! RunPythonTerminal !gnome-terminal -- python3 %
  autocmd FileType python nnoremap <buffer> <C-b> :RunPythonTerminal<CR>
]], false)

-- Run C++ files
vim.api.nvim_exec([[
  autocmd FileType cpp command! RunCpp !g++ % -o %< && ./%<
  autocmd FileType cpp nnoremap <buffer> <F5> :RunCpp<CR>

  autocmd FileType cpp command! RunCppTerminal !gnome-terminal -- g++ % -o %< && ./%<
  autocmd FileType cpp nnoremap <buffer> <C-b> :RunCppTerminal<CR>

  autocmd FileType cpp command! FormatCpp %!astyle --mode=c --style=ansi
  autocmd FileType cpp nnoremap <buffer> <leader>fm :FormatCpp<CR>
]], false)

-- Run Rust files
vim.api.nvim_exec([[
  autocmd FileType rust command! RunRust !cargo run
  autocmd FileType rust nnoremap <buffer> <F5> :RunRust<CR>

  autocmd FileType rust command! RunRustTerminal !gnome-terminal -- cargo run
  autocmd FileType rust nnoremap <buffer> <C-b> :RunRustTerminal<CR>
]], false)

