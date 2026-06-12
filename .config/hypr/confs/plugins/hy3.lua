hl.config({
    plugin = {
        hy3 = {
            -- =====================================================
            -- 节点折叠策略 node_collapse_policy
            -- =====================================================
            -- 当某组中移除一个子节点后，若该组只剩一个子节点，如何处理
            -- 0 = 直接删除该冗余组，子节点上提到父级
            -- 1 = 保留所有组，即使只有一个子节点也不折叠
            -- 2 = 仅当父组是标签组(tab)时保留，否则折叠
            -- 默认: 2
            --
            -- 源码行为 (Hy3Layout.cpp collapseParents()):
            --   移除节点后 recalc() 阶段遍历树，
            --   对单子节点组按此策略决定是否 wrap() 展开。
            node_collapse_policy = 2,
            -- =====================================================
            -- 组缩进 group_inset
            -- =====================================================
            -- 单窗口组的分割线偏移像素。
            -- 当一个 split 组内只有 1 个窗口时，原本的分割位置
            -- 会从边界向内偏移此值，便于视觉识别组的边界。
            -- 默认: 10
            group_inset = 10,
            -- =====================================================
            -- 首窗口自动标签 tab_first_window
            -- =====================================================
            -- 工作区首个窗口是否自动被包入一个标签组。
            -- true  → 每个工作区第一个窗口会自动创建 tab group
            -- false → 无此行为（推荐 false，手动控制）
            -- 默认: false
            tab_first_window = false,
            -- =====================================================
            -- 标签栏设置 tabs { ... }
            -- =====================================================
            tabs = {
                -- 标签栏高度（像素）
                height = 22,
                -- 标签栏与窗口内容区之间的间距
                padding = 6,
                -- 标签栏是否从窗口顶部"悬挂"而非从底部弹出
                from_top = false,
                -- 标签栏四个角的圆角半径
                radius = 6,
                -- 标签栏的边框宽度
                border_width = 2,
                -- 是否在标签上渲染窗口标题文字
                render_text = true,
                -- 标题文字是否居中
                text_center = true,
                -- 标题文字字体
                text_font = "Hack Nerd Font",
                -- 标题文字高度（像素，非字号）
                text_height = 8,
                -- 标题文字左侧内边距
                text_padding = 3,
                -- =====================================================
                -- 标签栏颜色体系
                -- 六组状态，每组三个子键
                -- 格式: "rgba(hex)"，A 通道控制透明度
                -- 默认值见右侧注释
                -- 注意：hy3 中使用以空格分隔的扁平键名（非嵌套），
                -- 但 hl.config 的 Lua 表支持嵌套写法。
                -- =====================================================
                colors = {
                    -- 当前激活标签（该标签的窗口是焦点）
                    active                    = "rgba(33ccff40)", -- 背景
                    active_border             = "rgba(33ccffee)", -- 边框
                    active_text               = "rgba(ffffffff)", -- 文字
                    -- 另一显示器上激活标签
                    active_alt_monitor        = "rgba(60606040)",
                    active_alt_monitor_border = "rgba(808080ee)",
                    active_alt_monitor_text   = "rgba(ffffffff)",
                    -- 当前组非激活但聚焦的标签（组内有焦点，但不是该标签页）
                    focused                   = "rgba(60606040)",
                    focused_border            = "rgba(808080ee)",
                    focused_text              = "rgba(ffffffff)",
                    -- 非聚焦标签
                    inactive                  = "rgba(30303020)",
                    inactive_border           = "rgba(606060aa)",
                    inactive_text             = "rgba(ffffffff)",
                    -- 紧急通知标签（如 windowrulev2 触发 urget）
                    urgent                    = "rgba(ff223340)",
                    urgent_border             = "rgba(ff2233ee)",
                    urgent_text               = "rgba(ffffffff)",
                    -- 锁定标签（locktab 锁定后）
                    locked                    = "rgba(90903340)",
                    locked_border             = "rgba(909033ee)",
                    locked_text               = "rgba(ffffffff)",
                },
                -- 标签背景是否启用模糊效果
                -- 仅当颜色非不透明时可见
                blur = true,
                -- 标签栏整体不透明度乘数
                opacity = 1.0,
            },
            -- =====================================================
            -- 自动平铺 autotile { ... }
            -- =====================================================
            autotile = {
                -- 是否启用自动平铺
                -- false → 纯手动平铺（hy3 核心模式）
                -- true  → hy3 根据窗口尺寸自动创建反方向子组
                enable = false,
                -- 自动创建的组是否 ephemeral（单窗口时自动删除）
                ephemeral_groups = true,
                -- 竖向触发阈值：水平布局中，若窗口被挤压到
                -- 此像素宽度以下，自动创建垂直 split 子组
                -- -1 = 从不自动竖分
                --  0 = 始终自动竖分
                -- >0 = 像素阈值
                trigger_width = 0,
                -- 横向触发阈值：垂直布局中，若窗口被挤压到
                -- 此像素高度以下，自动创建水平 split 子组
                trigger_height = 0,
                -- 生效工作区列表
                -- "all" 所有工作区
                -- "1,2" 仅 1 和 2
                -- "not:1,2" 排除 1 和 2
                workspaces = "4",
            },
        },
    },
})
