-- config/inlayhints.lua
--
-- local M = {}
--
-- M.enabled = true
--
-- function M.toggle()
--   M.enabled = not M.enabled
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.inlay_hint.enable(bufnr, { enabled = M.enabled })
--   print("Inlay hints: " .. (M.enabled and "ON" or "OFF"))
-- end
--
-- return M

local M = {}

M.enabled = true

function M.toggle()
  M.enabled = not M.enabled
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, { enabled = M.enabled })
  vim.notify("Inlay hints: " .. (M.enabled and "ON" or "OFF"))
end

return M
