return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({

      color_overrides = {
        all = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      }
    })

    -- dark theme
    vim.cmd.colorscheme "catppuccin"
    -- light theme
    -- vim.cmd.colorscheme "catppuccin-latte"
  end
}
