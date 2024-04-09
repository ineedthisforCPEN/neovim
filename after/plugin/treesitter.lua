IGNORE_LANGS = {}
INSTALL_LANGS = {
    "bash",
    "lua",
    "python",
    "query",
    "vim",
}

if vim.loop.os_uname().sysname == "Windows_NT" then
    require("nvim-treesitter.install").compilers = { "clang" }
    require("nvim-treesitter.install").prefer_git = false

    -- Some parsers are having problems loading their *.so libraries, so ignore
    -- them. Check in on this issue every now and again to see if it's been
    -- resolved.
    -- IGNORE_LANGS = { "c", "cpp", "c_sharp", "gitcommit" }
    IGNORE_LANGS = { "gitcommit", "vimdoc" }
end

require("nvim-treesitter.configs").setup({
    -- Parsers to support (or "all" for all of them)
    ensure_installed = INSTALL_LANGS,
    ignore_install = IGNORE_LANGS,
    sync_installed = false,

    -- Automatically install missing parsers when entering a buffer
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

