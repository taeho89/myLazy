return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- treesitter가 사용할 플러그인은 dependencies로 묶기
		dependencies = {
			{ "andymass/vim-matchup" },
			-- (필요하다면) { "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		-- config 대신 opts 사용: LazyVim이 안전하게 setup 호출해줌
		opts = {
			ensure_installed = {
				-- 시스템 프로그래밍
				"c",
				"cpp",
				"make",
				"asm",
				-- 스크립트/자동화
				"bash",
				"python",
				"lua",
				-- 웹 프론트엔드
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				-- 백엔드 & DB
				"json",
				"yaml",
				"toml",
				"sql",
				"prisma",
				-- 구성파일 & 도구
				"vim",
				"dockerfile",
				"gitignore",
				"markdown",
				"markdown_inline",
				-- 문법 강조 개선용
				"regex",
				"query",
			},
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			matchup = { enable = true },
		},
	},
}
