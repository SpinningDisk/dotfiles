return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 5000,
                lsp_format = "fallback",
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				go = { "gofmt" },
				odin = { "odinfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				elixir = { "mix" },

                python = { "black" },
                rust = { "rustfmt" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                make = { "shfmt" },
			},
			formatters = {
				["clang-format"] = {
					prepend_args = { "-style=file", "-fallback-style=LLVM" },
				},
			},
		})

		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({ bufnr = 0 })
		end)
	end,
}
