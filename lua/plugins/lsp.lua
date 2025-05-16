return {
	{
		"neovim/nvim-lspconfig", -- LSP 설정 플러그인
		dependencies = {
			"williamboman/mason.nvim", -- Mason 설치 도구
			"williamboman/mason-lspconfig.nvim", -- Mason과 LSP 연결
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Mason 설치 후 자동 설정
			mason_lspconfig.setup({
				ensure_installed = { "clangd", "lua_ls" }, -- 필요한 서버
				automatic_installation = true,
			})

			-- 각 LSP 서버별 설정 추가
			mason_lspconfig.setup_handlers({
				function(server_name) -- 기본 설정
					lspconfig[server_name].setup({
						capabilities = vim.lsp.protocol.make_client_capabilities(),
					})
				end,
				["clangd"] = function() -- clangd 커스터마이징
					lspconfig.clangd.setup({
						capabilities = vim.lsp.protocol.make_client_capabilities(),
						root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
						cmd = {
							"clangd",
							"--compile-commands-dir=/home/takwak/Projects/mygit/3_Circle/philosophers/philo",
						}, -- clangd에서 `offset_encoding` 명시
						on_attach = function(client, bufnr)
							-- 'gd'로 정의로 이동하는 기능 활성화
							vim.api.nvim_buf_set_keymap(
								bufnr,
								"n",
								"gd",
								"<Cmd>lua vim.lsp.buf.definition()<CR>",
								{ noremap = true, silent = true }
							)
						end,
					})
				end,
				["lua_ls"] = function() -- Lua 설정
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" }, -- Neovim 글로벌 변수 무시
								},
							},
						},
					})
				end,
			})
		end,
	},
}
