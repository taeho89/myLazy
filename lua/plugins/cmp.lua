-- ~/.config/nvim/lua/plugins/cmp.lua

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			completion = {
				keyword_length = 3, -- 최소 3글자 이상 입력해야 자동완성 시작
			},
			experimental = {
				ghost_text = false, -- ghost text 비활성화 (crash 방지)
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
