-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Lua 스타일 설정
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.c",
	command = "set filetype=c",
})
