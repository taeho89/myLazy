-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_keymap("n", "<F1>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F1>", ":Stdheader<CR>", { noremap = true, silent = true })

-- require("cmp").setup({
-- 	completion = {
-- 		autocomplete = false, -- 자동완성 비활성화
-- 	},
-- })

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- LazyVim의 자동 포맷팅 설정 비활성화
-- lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
-- 	on_attach = function(client, bufnr)
-- 		client.server_capabilities.documentFormattingProvider = false
-- 		client.server_capabilities.documentRangeFormattingProvider = false
-- 	end,
-- })
