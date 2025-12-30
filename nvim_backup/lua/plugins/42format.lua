local M = {}

vim.g.o_expandtab = vim.o.expandtab
vim.g.o_tabstop = vim.o.tabstop
vim.g.o_shiftwidth = vim.o.shiftwidth

-- Variables to store the alternate settings
vim.g.a_expandtab = false
vim.g.a_tabstop = 2
vim.g.a_shiftwidth = 2

local function check_settings()
	if vim.o.expandtab ~= vim.g.o_expandtab then
		return false
	elseif vim.o.tabstop ~= vim.g.o_tabstop then
		return false
	elseif vim.o.shiftwidth ~= vim.g.o_shiftwidth then
		return false
	else
		return true
	end
end

-- Function to toggle between the original and alternate settings
local function toggle_indent_settings(silent)
	local status_string = "42format"
	if check_settings() then
		-- Switch to alternate settings
		vim.o.expandtab = vim.g.a_expandtab
		vim.o.tabstop = vim.g.a_tabstop
		vim.o.shiftwidth = vim.g.a_shiftwidth
		status_string = status_string
			.. " on - expandtab: "
			.. tostring(vim.o.expandtab)
			.. ", tabstop: "
			.. vim.o.tabstop
			.. ", shiftwidth: "
			.. vim.o.shiftwidth
	else
		-- Switch back to original settings
		vim.o.expandtab = vim.g.o_expandtab
		vim.o.tabstop = vim.g.o_tabstop
		vim.o.shiftwidth = vim.g.o_shiftwidth
		status_string = status_string
			.. " off - expandtab: "
			.. tostring(vim.o.expandtab)
			.. ", tabstop: "
			.. vim.o.tabstop
			.. ", shiftwidth: "
			.. vim.o.shiftwidth
	end

	if not silent then
		print(status_string)
	end
end

-- Map F3 key to toggle the indent settings
vim.api.nvim_create_user_command("Toggle42format", function()
	toggle_indent_settings(false)
end, {})
vim.api.nvim_set_keymap("n", "<F3>", ":Toggle42format<CR>", { noremap = true, silent = true })

toggle_indent_settings(true)

return M
