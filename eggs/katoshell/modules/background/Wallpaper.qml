import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.modules.background.items

Scope {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: root

            required property ShellScreen modelData
            screen: modelData
            exclusionMode: ExclusionMode.Ignore
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }
            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.namespace: "katoshell.wallpaper"
            color: "transparent"

            WallpaperImage {}
        }
    }
}
