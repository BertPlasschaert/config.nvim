return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "pylsp",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
            organizeImports = true,
            lineLength = 79,
            lint = {
              mccabe = {
                maxComplexity = 10,
              },
              extendSelect = { "ALL" },
              ignore = {
                "UP",   -- pyupgrade
                "FURB",
                "ANN",  -- Do not enforce type annotations
                "C408", -- Prefer collecting call over literal
                "TD",   -- no TODO linting
                "D100", -- no missing docstring in public module
                "D101", -- no missing docstring in public class
              },
            },
          },
        },
      })
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              -- type checker
              pylsp_mypy = { enabled = false },
              -- auto-completion options
              jedi_completion = { fuzzy = false },
              -- formatter options
              black = { enabled = false },
              autopep8 = { enabled = false },
              flake8 = { enabled = false },
              yapf = { enabled = false },
              -- linter options
              pylint = { enabled = false },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              -- import sorting
              pyls_isort = { enabled = false },
              rope_autoimport = { enabled = false },
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>qf", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
