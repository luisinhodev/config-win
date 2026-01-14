local values = require("config.values")

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_cr = true,
    },
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" }, -- it will not add a pair on that treesitter node
          javascript = { "template_string" },
          java = false,  -- don't check treesitter on java
          angular = false,
        },
      })

      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      npairs.add_rules({
        Rule(" ", " "):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end),
      })
      for _, bracket in pairs(brackets) do
        npairs.add_rules({
          Rule(bracket[1] .. " ", " " .. bracket[2])
              :with_pair(function()
                return false
              end)
              :with_move(function(opts)
                return opts.prev_char:match(".%" .. bracket[2]) ~= nil
              end)
              :use_key(bracket[2]),
        })
      end
    end,
  },
  -- hop
  {
    "smoka7/hop.nvim",
    version = "*", -- optional but strongly recommended
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  -- surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  -- Comment
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", desc = "Comment current line" },
      { "gc",  mode = "v",                   desc = "Comment selected text" },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  -- multicursors
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      -- set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
      -- set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
      -- Añadir cursor arriba con Alt + Flecha Arriba
      set({"n", "x"}, "<A-Up>", function() mc.lineAddCursor(-1) end)
      -- Añadir cursor abajo con Alt + Flecha Abajo
      set({"n", "x"}, "<A-Down>", function() mc.lineAddCursor(1) end)

      set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
      set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end)
      set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
      set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end)
      set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end
  },
  -- quick type
  {
    "Redoxahmii/json-to-types.nvim",
    build = "sh install.sh pnpm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
    ft = "json",
    keys = {
      {
        "<leader>cU",
        "<CMD>ConvertJSONtoLang typescript<CR>",
        desc = "Convert JSON to TS",
      },
      {
        "<leader>ct",
        "<CMD>ConvertJSONtoLangBuffer typescript<CR>",
        desc = "Convert JSON to TS Buffer",
      },
    },
  },
  --atone
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    opts = {}, -- your configuration here
  },
  -- Conform just nvim 0.10 xd :(
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Formatea al guardar
    version = "v8.1.0",
    config = function()
      local conform = require("conform")

      conform.setup({
        -- Define los formateadores disponibles para cada tipo de archivo
        formatters_by_ft = {
          -- C#: Usa csharpier (leerá tu csharpierrc.json o .editorconfig para 2 espacios)
          csharp = { "csharpier" },

          -- TypeScript/JavaScript: Usa prettier (leerá tu .prettierrc o package.json)
          typescript = { "prettier" },
          javascript = { "prettier" },
          typescriptreact = { "prettier" },
          javascriptreact = { "prettier" },

          -- Lua: Usa stylua
          lua = { "stylua" },

          -- Python: Usa black
          python = { "black" },

          -- JSON, YAML, MarkDown, CSS: Usa prettier
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          css = { "prettier" },
        },
        formatters = {
          prettier = {
            -- Aquí defines los argumentos que se pasan al comando de Prettier
            args = { "--stdin-filepath", "$FILENAME", "--no-semi", "--bracket-spacing" },
          },
        },
        -- Opciones globales
        format_on_save = {
          timeout_ms = 500,
          interval_ms = 100,
          -- Asegúrate de que formatee solo si es un tipo de archivo soportado
          ft_whitelist = {
            "csharp",
            "typescript",
            "javascript",
            "lua",
            "python",
            "json",
            "yaml",
            "markdown",
            "css",
          },
        },
      })

      -- Mapeo de teclas opcional para formatear manualmente
      -- Puedes usar el mismo mapeo que tenías antes:
      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        conform.format({
          async = true,
          timeout_ms = 500,
          lsp_format = "only", -- Intenta usar el LSP si conform no encuentra un formateador
        })
      end, { desc = "Format file" })
    end,
  },
  -- tagalong chanse
  "AndrewRadev/tagalong.vim",
  -- pick color
  "KabbAmine/vCoolor.vim",
  -- astro
  { "wuelnerdotexe/vim-astro",  enabled = values.syntax.astro },
  -- pug
  { "digitaltoad/vim-pug",      enabled = values.syntax.pug },
  -- jinja2
  { "Glench/Vim-Jinja2-Syntax", enabled = values.syntax.jinja },
}
