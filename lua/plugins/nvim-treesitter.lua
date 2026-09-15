-- nvim-treesitter's `main` branch is a full rewrite (targets Nvim 0.12+).
-- It drops `auto_install` and no longer enables highlighting/indent itself,
-- so both are wired up explicitly below. See:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/README.md

local parsers = {
  -- languages actually in use (matches lsp-config.lua's servers)
  "lua",
  "go",
  "gomod",
  "gowork",
  "gotmpl",
  "python",
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "vue",
  -- config/doc filetypes
  "bash",
  "markdown",
  "markdown_inline",
  "vim",
  "vimdoc",
  "query",
  "json",
  "yaml",
  "toml",
  "diff",
  "gitcommit",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(parsers):wait(300000)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
