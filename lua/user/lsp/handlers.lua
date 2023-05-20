local M = {}
local keymap = require "user.core.utils".keymap

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

local function lsp_keymaps(_)
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
  keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
  keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not present then
  print("cmp_nvim_lsp not yet installed!")
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
