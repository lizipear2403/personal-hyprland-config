local slaveMod    = "CTRL"
local terminal    = "kitty"
local mainMod     = "SUPER"
local secMod      = "SHIFT"
local thrMod      = "ALT"
local fileManager = "kitty yazi"
local runMenu     = "rofi -show drun"

local hy3         = hl.plugin.hy3

local Keys        = {
    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3,
    ["4"] = 4
}

hl.config(
    {
        debug = {
            disable_logs = false,
            enable_stdout_logs = true,
        }
    }
)

-- hl.define_submap("make_group", function()
--     hl.bind("V", function()
--         if hy2 then hl.dispatch(hy3.make_group("v")) end
--         hl.dispatch(hl.dsp.submap("reset"))
--     end)
--     hl.bind("H", function()
--         if hy2 then hl.dispatch(hy3.make_group("h")) end
--         hl.dispatch(hl.dsp.submap("reset"))
--     end)
-- end)


if hy3 then
    if not hy3 then return end

    hl.define_submap("make_group", function()
        hl.bind("V", function()
            hl.dispatch(hy3.make_group("v"))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
        hl.bind("H", function()
            hl.dispatch(hy3.make_group("h"))
            hl.dispatch(hl.dsp.submap("reset"))
        end)
    end)

    local hy3_directions = {
        h = "left", j = "down", k = "up", l = "right"
    }

    hl.bind(mainMod .. "+M", function()
        local ws = hl.get_active_workspace()
        if ws and ws.tiled_layout == "hy3" then
            hl.dispatch(hl.dsp.submap("make_group"))
        end
    end)

    hl.bind(mainMod .. "+TAB", hy3.make_group("tab"))
    hl.bind(mainMod .. "+C", hy3.kill_active())
    hl.bind(mainMod .. "+down", hy3.change_focus("lower"))
    hl.bind(mainMod .. "+up", hy3.change_focus("raise"))

    for key, direc in pairs(hy3_directions) do
        hl.bind(mainMod .. "+" .. key, hy3.move_focus(direc, {}))
        hl.bind(mainMod .. "+" .. secMod .. "+" .. key, hy3.move_window(direc, { once = true }))
    end

    -- if not hy3 then return end
    -- local Hy3_directions = {
    --     ["H"] = "left",
    --     ["J"] = "down",
    --     ["K"] = "up",
    --     ["L"] = "right"
    -- }


    -- if workspace == nil then return end
    -- hl.define_submap("make_group", function()
    --     hl.bind("V", function()
    --         if hy3 then hl.dispatch(hy3.make_group("v")) end
    --         hl.dispatch(hl.dsp.submap("reset"))
    --     end)
    --     hl.bind("H", function()
    --         if hy3 then hl.dispatch(hy3.make_group("h")) end
    --         hl.dispatch(hl.dsp.submap("reset"))
    --     end)
    -- end)
    -- if workspace.tiled_layout == "hy3" then
    --     hl.bind(mainMod .. "+M", function() hl.dispatch(hl.dsp.submap("make_group")) end)
    --     hl.bind(mainMod .. "+TAB", hy3.make_group("tab")) -- 创建标签页
    --     hl.bind(mainMod .. "+C", hy3.kill_active())
    --     hl.bind(mainMod .. "+down", hy3.change_focus("lower"))
    --     hl.bind(mainMod .. "+up", hy3.change_focus("raise"))
    --     for key, direc in pairs(Hy3_directions) do
    --         hl.bind(mainMod .. "+" .. key, function() hl.dispatch(hy3.move_focus(direc, {})) end)
    --         hl.bind(mainMod .. "+" .. secMod .. "+" .. key,
    --             function() hl.dispatch(hy3.move_window(direc, { once = true })) end)
    --     end
    -- end
end



local function debug_notice(info) -- 使用hypr自带通知创建info查看 实时
    hl.notification.create({
        text = info,
        timeout = 5000, -- 5秒后自动消失
        icon = 2,       -- INFO 图标
    })
end


-- hy3Bind() -- 绑定hy3相关的快捷键

hl.bind(mainMod .. "+T", function() -- SUPER + T 发送测试信息
    local ws = hl.get_active_workspace()
    if ws == nil then
        return
    end
    local info = "wsID:\t" .. ws.id .. "\t" .. "layout:\t" .. ws.tiled_layout
    debug_notice(info)
end)



hl.bind(mainMod .. "+C", function() -- 关闭窗口和标签页(hy3)
    hl.dispatch(hl.dsp.window.close())
end)


hl.bind(mainMod .. "+N", hl.dsp.exec_cmd("swaync-client -t -sw"))                                         -- 通知栏
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd("~/.local/bin/cliphist-rofi"))                                   --剪贴板
hl.bind(mainMod .. "+Q", hl.dsp.exec_cmd(terminal))                                                       --终端
hl.bind(mainMod .. "+E", hl.dsp.exec_cmd(fileManager))                                                    --文件管理器(默认为yazi)
hl.bind(thrMod .. "+SPACE", hl.dsp.exec_cmd(runMenu))                                                     --运行菜单

hl.bind(slaveMod .. "+" .. thrMod .. "+Z", hl.dsp.exec_cmd("pypr zoom"))                                  -- 放大镜
hl.bind(mainMod .. "+G", hl.dsp.exec_cmd("pypr toggle terminal"))                                         --顶部下拉窗口

hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen_state({ internal = 1, client = 1, action = "toggle" })) -- 全屏

hl.bind(mainMod .. "+" .. secMod .. "+R", hl.dsp.exec_cmd("hyprctl reload"))                              --重载配置

hl.bind(thrMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })                                  -- 拖拽窗口

hl.bind(slaveMod .. "+" .. thrMod .. "+" .. "A", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))    --截图




local HJKL_DIR = {
    { key = "H", direc = "left" },
    { key = "J", direc = "down" },
    { key = "K", direc = "up" },
    { key = "L", direc = "right" },
}


-- 绑定工作区移动
hl.bind(mainMod .. "+" .. thrMod .. "+ H", function()
    local monitor = hl.get_active_monitor()
    local workspaces = hl.get_active_workspace()
    if monitor == nil or workspaces == nil then
        return
    end
    if monitor.id == 0 then
        if workspaces.id == 1 then
            return
        else
            hl.dispatch(hl.dsp.focus({ workspace = workspaces.id - 1 }))
        end
    end
    if monitor == 1 then
        if workspaces.id == 11 then
            return
        else
            hl.dispatch(hl.dsp.focus({ workspace = workspaces.id - 1 }))
        end
    end
end)

hl.bind(mainMod .. "+" .. thrMod .. "+ L", function()
    local monitor = hl.get_active_monitor()
    local workspaces = hl.get_active_workspace()
    if monitor == nil or workspaces == nil then
        return
    end
    if monitor.id == 0 then
        if workspaces.id == 4 then
            return
        else
            hl.dispatch(hl.dsp.focus({ workspace = workspaces.id + 1 }))
        end
    end
    if monitor == 1 then
        if workspaces.id == 13 then
            return
        else
            hl.dispatch(hl.dsp.focus({ workspace = workspaces.id + 1 }))
        end
    end
end)

hl.bind(mainMod .. "+" .. slaveMod .. "+ L", function()
    local monitor = hl.get_active_monitor()
    local workspaces = hl.get_active_workspace()
    if monitor == nil or workspaces == nil then
        return
    end
    if monitor.id == 0 then
        if workspaces.id == 4 then
            return
        else
            hl.dispatch(hl.dsp.window.move({ workspace = workspaces.id + 1 }))
        end
    end
    if monitor == 1 then
        if workspaces.id == 13 then
            return
        else
            hl.dispatch(hl.dsp.window.move({ workspace = workspaces.id + 1 }))
        end
    end
end)
hl.bind(mainMod .. "+" .. slaveMod .. "+ H", function()
    local monitor = hl.get_active_monitor()
    local workspaces = hl.get_active_workspace()
    if monitor == nil or workspaces == nil then
        return
    end
    if monitor.id == 0 then
        if workspaces.id == 1 then
            return
        else
            hl.dispatch(hl.dsp.window.move({ workspace = workspaces.id - 1 }))
        end
    end
    if monitor == 1 then
        if workspaces.id == 11 then
            return
        else
            hl.dispatch(hl.dsp.window.move({ workspace = workspaces.id - 1 }))
        end
    end
end)


for _, Pair in ipairs(HJKL_DIR) do
    hl.bind(mainMod .. "+" .. secMod .. "+" .. Pair.key, function()
        local ws = hl.get_active_workspace()
        if ws == nil then
            return
        end
        if ws.tiled_layout == "hy3" then
            -- debug_notice("hy3")
            -- if hy3 then hl.dispatch(hy3.move_window(Pair.direc, { once = true })) end
        else
            -- debug_notice("Not hy3")
            hl.dispatch(hl.dsp.window.move({ direction = Pair.direc }))
        end
    end)
    -- hl.bind(mainMod .. "+" .. v, hl.dsp.focus({ direction = v }))
    hl.bind(mainMod .. "+" .. Pair.key, function()
        local ws = hl.get_active_workspace()
        if ws == nil then
            return
        end
        if ws.tiled_layout == "hy3" then
            -- debug_notice("hy3")
            -- if hy3 then hl.dispatch(hy3.move_focus(Pair.direc, {})) end
        else
            -- debug_notice("Not hy3")
            hl.dispatch(hl.dsp.focus({ direction = Pair.direc }))
        end
    end)
end
