-- lua/plugins/lspconfig.lua 또는 lua/config/lsp.lua 파일에 추가
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					cmd = { "clangd" },
				},
			},
		},
	},
}
