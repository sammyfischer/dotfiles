local themes = {
    ['dracula'] = true,
    ['dracula-soft'] = true,
}

return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        opts = {
            colors = {
                bg = "#1e2028" -- default bg is too bright for me
            }
        },
        enable = themes[selected_theme] == true -- disable if not selected_theme
    },
}
