local values = require("config.values")
local has_enabled = values.servers

local lsp_flags = {
	debounce_text_changes = 150,
}

local default = {
	flags = lsp_flags,
}

local servers = {}

servers.emmet_language_server = {
	autoload = has_enabled.emmet_language_server,
	config = {
		flags = lsp_flags,
		filetypes = {
			"css",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"pug",
			"typescriptreact",
			"vue",
			"angular",
			"jinja",
		},
	},
}

servers.html = {
	autoload = has_enabled.html,
	config = default,
}
servers.cssls = {
	autoload = has_enabled.cssls,
	config = {
		flags = lsp_flags,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	},
}
servers.jsonls = {
	autoload = has_enabled.jsonls,
	config = default,
}
servers.prismals = {
	autoload = has_enabled.prismals,
	config = default,
}
servers.lua_ls = {
	autoload = has_enabled.lua_ls,
	config = {
		flags = lsp_flags,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				-- workspace = {
				--   library = vim.api.nvim_get_runtime_file("", true),
				--   checkThirdParty = false,
				-- },
				telemetry = {
					enable = false,
				},
				hint = {
					enable = false,
				},
			},
		},
	},
}
servers.marksman = {
	autoload = has_enabled.marksman,
	config = default,
}

servers.pyright = {
	autoload = has_enabled.pyright,
	config = {
		flags = lsp_flags,
	},
}
servers.pylsp = {
	autoload = has_enabled.pylsp,
	config = {
		flags = lsp_flags,
	},
}
servers.angularls = {
	autoload = has_enabled.angularls,
  config = {
		flags = lsp_flags
  }
}

servers.tailwindcss = {
	autoload = has_enabled.tailwindcss,
	config = {
		flags = lsp_flags,
    validate = true,
    experimental = {
      classRegex = {},
    },
    -- root_dir = util.root_pattern("tailwind.config.js", "package.json", "tsconfig.json"),
		filetypes = {
			"blade",
			"html",
			"javascriptreact",
			"jade",
			"volar",
			"typescriptreact",
			"svelte",
			"pug",
			"vue",
			"angular",
		},
	},
}

servers.vue_ls = {
	autoload = has_enabled.vue_ls,
	config = {
		flags = lsp_flags,
		filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		-- root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
		settings = {
			vue = {
				-- Generalmente se usa el modo Hybrid (por defecto) o false, si usas ts_ls
				hybridMode = false, -- Asegura que ts_ls tome el control del TS
			},
		},
	},
}
local vue_plugin = {
	name = "@vue/typescript-plugin",
	-- location = vue_language_server_path,
	location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
	languages = { "vue" },
	configNamespace = "typescript",
}

-- servers.vtsls = {
-- 	autoload = has_enabled.vtsls,
-- 	config = {
-- 		settings = {
-- 			vtsls = {
-- 				tsserver = {
-- 					globalPlugins = {
-- 						vue_plugin,
-- 					},
-- 				},
-- 			},
-- 		},
-- 		filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- 	}
-- }
servers.ts_ls = {
	autoload = has_enabled.ts_ls,
	config = {
		flags = lsp_flags,
		filetypes = {
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"vue",
		},
		init_options = {
			plugins = {
				vue_plugin,
			},
		},
		-- root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
		settings = {

			javascript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = false,
				},
			},

			typescript = {
				inlayHints = {
					includeInlayEnumMemberValueHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayVariableTypeHints = false,
				},
			},
		},
	},
}

return servers
