return {
    "williamboman/mason.nvim",
    version = "*",
    lazy = false,
    dependencies = {},
    config = function()
        require('mason').setup({
            PATH = 'prepend',
            pip = {
                install_args = {
                    "--proxy", "socks5h://127.0.0.1:9898",
                    "--timeout", "5",
                    "--retries", "5"
                },
            }
        })
    end,
}
