-- workspace Rule
--

hl.workspace_rule({ workspace = "1", layout = "dwindle", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "2", layout = "master", monitor = "eDP-1" })
hl.workspace_rule({
    workspace = "3",
    layout = "scrolling",
    monitor = "eDP-1"
})
hl.workspace_rule(
    {
        workspace = "4",
        layout = "hy3",
        monitor = "eDP-1"
    }
)
hl.workspace_rule({
    workspace = "11",
    layout = "scrolling",
    monitor = "HDMI-A-1",
    default = true
})
hl.workspace_rule({
    workspace = "12",
    layout = "scrolling",
    monitor = "HDMI-A-1"
})
hl.workspace_rule({
    workspace = "13",
    layout = "scrolling",
    monitor = "HDMI-A-1"
})
