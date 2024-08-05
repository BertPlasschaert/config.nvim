return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "pylsp",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ruff.setup({})
      -- lspconfig.pylsp.setup({})
      local settings = {
        pylsp = {
          plugins = {
            -- type checker
            pylsp_mypy = { enabled = true },
            -- auto-completion options
            jedi_completion = { fuzzy = true },
            -- formatter options
            black = { enabled = false},
            autopep8 = { enabled = false },
            yapf = { enabled = false },
            -- linter options
            pylint = { enabled = false},
            pyflakes = { enabled = false },
            pycodestyle = { enabled = false },
            -- import sorting
            pyls_isort = { enabled = false},
          },
        },
      },


      -- })
      vim.keymap.set("n","<leader>qf",vim.lsp.buf.hover, {})
      vim.keymap.set("n","gd",vim.lsp.buf.definition, {})
      vim.keymap.set("n","<leader>ca", vim.lsp.buf.code_action, {})
    end
  }
}
