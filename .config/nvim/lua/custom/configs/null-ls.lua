local present, null_ls = pcall(require, "null-ls")
local autogroup = vim.api.nvim_create_augroup("LspFormatting",{})

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- go
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function name(client,bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = autogroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre",{
        group = autogroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
        end
      })
    end
  end
}
