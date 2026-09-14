return {
  "jay-babu/mason-null-ls.nvim",
  pin = true,
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
