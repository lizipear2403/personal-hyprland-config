require("confs.start")
require("confs.monitors")
require("confs.generalBind")
require("confs.workspace")
require("confs.decoration")

require("confs.plugins.hy3")
require("confs.plugins.hyprglass")

-- ENV变量

hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")
-- 鼠标灵敏度

hl.config({
    input = {
        sensitivity = -0.7,
    },
    xwayland = {
        force_zero_scaling = true
    },

})

-- 插件配置

hl.config({
    general = {
        layout = "hy3"
    },
})
