return {
  "stevearc/oil.nvim",
  opts = {},
  config = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end
      },

    })
  end
}
