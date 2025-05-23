return {
	-- Treesitter 플러그인
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"vim",
					"bash",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				matchup = {
					enable = true, -- vim-matchup 연동
				},
			})
		end,
	},

	-- 괄호 매칭 강화용 플러그인 (필수 아님, 권장)
	{
		"andymass/vim-matchup",
		lazy = true, -- 필요할 때 로드 (성능 최적)
		event = "VeryLazy",
	},
}
