return {
  {
    "mason-org/mason.nvim",
    version = "^2.0.0",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0.0",
    dependencies = {
      { "mason-org/mason.nvim", version = "^2.0.0" },
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- mason-lspconfig auto-installs these and auto-calls vim.lsp.enable()
      -- for each one (automatic_enable defaults to true).
      ensure_installed = {
        "lua_ls",
        "ruff",
        "pylsp",
        "htmx",
        "cssls",
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Applies to every server (merges into the per-server configs below
      -- and into nvim-lspconfig's built-in defaults).
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("volar", {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      })

      vim.lsp.config("pylsp", {
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
              mccabe = { enabled = true },
              -- import sorting
              pyls_isort = { enabled = false },
              rope_autoimport = { enabled = false },
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true,     -- stricter gofmt
            staticcheck = true, -- linting, no extra tool needed
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              unusedwrite = true,
              nilness = true,
              shadow = true,
            },
          },
        },
      })

      -- html, volar and eslint aren't installed via Mason (ensure_installed
      -- above), so mason-lspconfig's automatic_enable won't turn them on.
      -- Their binaries are expected on $PATH some other way (e.g. npm i -g
      -- vscode-langservers-extracted, @vue/language-server).
      vim.lsp.enable({ "html", "volar", "eslint" })

      vim.keymap.set("n", "<leader>qf", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
