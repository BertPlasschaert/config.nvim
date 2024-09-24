return {
  "catppuccin/nvim",
  lazy=false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- dak theme
    vim.cmd.colorscheme "catppuccin"
    -- light theme
    -- vim.cmd.colorscheme "catppuccin-latte"
  end
}
