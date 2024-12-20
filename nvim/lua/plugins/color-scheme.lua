-- return {
--   {
--     "catppuccin/nvim",
--     opts = {
--       flavour = "mocha",  -- "mocha" flavour 설정
--       transparent_background = true,  -- 배경 투명 설정
--       styles = {
--         sidebars = "transparent",  -- 사이드바 투명
--         floats = "transparent",  -- 팝업창 투명
--         keywords = { bold = true },
--         functions = { bold = true },
--       },
--       on_colors = function(colors)
--         -- statusline 배경을 투명으로 설정
--         colors.bg_statusline = "none"
--         -- 전체 배경을 투명으로 설정
--         colors.bg = "none"
--         -- 추가적으로, 만약 필요하면 아래와 같이 테마 설정을 통해 statusline, float, etc.의 배경을 지정할 수 있습니다.
--         colors.bg_float = "none"
--         colors.bg_popup = "none"
--       end,
--     },
--   },
-- }

return {
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "storm",
			transparent = true,
			styles = {
				sidebars = "transparent",
				keywords = { bold = true },
				functions = { bold = true },
				floats = "transparent",
			},
			on_colors = function(colors)
				colors.bg_statusline = colors.none -- To check if its working try something like "#ff00ff" instead of colors.none
				colors.bg = colors.none
			end,
		},
	},
}
