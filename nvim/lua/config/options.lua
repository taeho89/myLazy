-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = true
-- vim.g.autoformat = false

-- lua/config/options.lua 또는 lazyvim config 안에 추가
vim.opt.fillchars = {
	vert = "┃",
	horiz = "━",
	eob = " ",
	horizup = "┻",
	horizdown = "┳",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

vim.opt.winbar = "%=%m %f" -- 수정됨 표시 + 상대경로 파일명
-- 또는 전체경로로 하고 싶으면
-- vim.opt.winbar = "%=%m %F"
