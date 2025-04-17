return {
    "mhartington/formatter.nvim",
    version = "*",
    lazy = false,
    dependencies = {},
    config = function()
        local util = require("formatter.util")

        local prettier = {
            function()
                return {
                    exe = "prettierd",
                    args = {
                        -- "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                    -- try_node_modules = true,
                }
            end
        }

        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                javascript = prettier,
                typescript = prettier,
                javascriptreact = prettier,
                typescriptreact = prettier,
                css = prettier,
                html = prettier,
                scss = prettier,
                sass = prettier,
                json = prettier,
                markdown = prettier,
            }
        })
    end,
}
