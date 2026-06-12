-- 美化

local color = {
    pink = "rgb(ff548a)",
    inactive_pink = "rgb(e08ba9)"
}

hl.config({
    general = {
        border_size = 4,
        col = {
            active_border   = color.pink,
            inactive_border = color.inactive_pink,
        },
    },
    decoration = {
        rounding = 20,

        blur = {
            enabled            = true,
            size               = 4,
            passes             = 3,
            new_optimizations  = true,
            xray               = true,
            ignore_opacity     = true,
            popups             = true,
            popups_ignorealpha = 0.2,
        },
        active_opacity = 1.0,
        inactive_opacity = 0.8,

    },
})
