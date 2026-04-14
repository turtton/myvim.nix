-- Server configuration table.
-- Keys are lspconfig server names.
-- Values:
--   {} = default config (no overrides)
--   { ... } = static setup options (settings, capabilities, etc.)
--   function(capabilities) = dynamic setup options (evaluated at config time)

return {
	-- Markup
	html = {},

	---- CSS
	cssls = {},

	---- JSON (schemastore integration)
	jsonls = function(capabilities)
		return {
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		}
	end,

	-- Web frameworks
	---- Angular
	angularls = {},

	---- Astro
	astro = {},

	---- Svelte
	svelte = {},

	---- Vue
	vuels = {},

	-- Programming
	---- Go
	gopls = {},

	---- Nix
	nixd = {},

	---- Ocaml
	ocamllsp = {},

	---- Python
	pyright = {},
	ruff = {},

	---- Zig
	zls = {},

	-- Config like
	---- Docker
	dockerls = {},

	---- TOML
	taplo = {},

	---- YAML (schemastore integration)
	yamlls = function()
		return {
			settings = {
				yaml = {
					schemaStore = {
						-- You must disable built-in schemaStore support if you want to use
						-- this plugin and its advanced options like `ignore`.
						enable = false,
						-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		}
	end,

	-- Schema
	---- GraphQL
	graphql = {},

	---- Protocol Buffers
	buf_ls = {},

	---- Prisma ORM
	prismals = {},

	-- Misc
	---- Bash
	bashls = {},

	---- Lua
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},

	---- Terraform
	terraformls = {},

	---- Typst
	tinymist = {},

	---- Markdown
	markdown_oxide = {},

	---- Typo
	typos_lsp = {},
}
