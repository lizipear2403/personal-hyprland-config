hl.config({
    plugin = {
        dynamic_cursors = {
            enabled = true,
            mode = "stretch", -- "tilt" | "rotate" | "stretch" | "none"
            threshold = 2,    -- 最小角度变化阈值（度），越小越平滑但硬件光标开销更大
            rotate = {
                length = 20,  -- 模拟"棍子"长度（px），设为实际光标大小最真实
                offset = 0.0, -- 顺时针角度偏移（度）
            },
            tilt = {
                limit = 5000,                      -- 达到最大倾斜所需速度（px/s），值越小倾斜越敏感
                activation = "negative_quadratic", -- linear | quadratic | negative_quadratic
                window = 100,                      -- 速度计算窗口（ms），越大越平滑但延迟更高
                full = 60,                         -- 每侧最大倾斜角度（°）
            },
            stretch = {
                limit = 1500,          -- 达到最大拉伸所需速度（px/s），满拉伸 = 2倍原长度
                activation = "linear", -- linear | quadratic | negative_quadratic
                window = 100,
            },
            shake = {
                enabled = true,
                threshold = 6.0, -- 抖动检测灵敏度，越低越容易触发
                base = 4.0,      -- 抖动开始时立即放大倍数
                speed = 4.0,     -- 持续抖动时每秒额外增加倍数
                influence = 0.0, -- 当前抖动强度对 speed 的影响程度
                limit = 0.0,     -- 最大放大倍数（0 = 无限制）
                timeout = 2000,  -- 抖动停止后保持放大状态的时间（ms）
                effects = false, -- 放大时是否同时显示 tilt/rotate/stretch 效果
                ipc = false,     -- 是否通过 Hyprland event socket 发送抖动事件
            },
            hyprcursor = {
                nearest = 1,             -- 0=从不像素化 1=无高清图时像素化 2=始终像素化
                enabled = true,          -- 启用 hyprcursor 高清纹理支持（需要 SVG 主题）
                resolution = -1,         -- 预加载分辨率（-1 = 光标尺寸 × shake.base）
                fallback = "clientside", -- client 端光标放大时使用的替代形状
            },
        },
    },

})
