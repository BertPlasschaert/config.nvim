return {
        "echasnovski/mini.nvim",
        opts = {
            n_lines = 500,
        -- mappings = {
            -- left = "H",
            -- right = "L",
            -- down = "J",
            -- up = "K",

            -- line_left = "",
            -- line_right = "",
            -- line_down = "",
            -- line_up = "",
        -- },
        },

        config = function ()
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup()
            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require("mini.surround").setup()

            require("mini.move").setup()
    end
}
