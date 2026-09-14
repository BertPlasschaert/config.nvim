return {
  "jay-babu/mason-null-ls.nvim",
  commit = "de19726de7260c68d94691afb057fa73d3cc53e7",
  priority = 1000,
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "stylua",
        "mypy",
        "prettierd",
      }
    })
  end
}
