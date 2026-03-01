return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				-- C / C++
				"clangd",

				-- Python
				"pyright",

				-- Java
				"jdtls",

				-- JS / TS / TSX
				"ts_ls",
				"eslint",

				-- HTML / CSS
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",

				-- JSON / YAML
				"jsonls",
				"yamlls",

				-- Docker
				"dockerls",

				-- Markdown
				"marksman",

				-- CMake
				"cmake",

				-- Bash
				"bashls",

				-- Lua
				"lua_ls",

				-- Vim script
				"vimls",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- C / C++
				"clang-format",

				-- Python
				"black",
				"isort",
				"pylint",

				-- JS / TS / HTML / CSS / Markdown
				"prettier",
				"eslint_d",

				-- Shell
				"shfmt",

				-- Lua
				"stylua",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
