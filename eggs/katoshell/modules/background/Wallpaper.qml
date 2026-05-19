import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.common.config

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

            readonly property string wallpaperPath: {
                if (Config.data.wallpaper.current == "" || Config.data.wallpaper.current.length == 0) {
                    return Quickshell.shellPath("common/assets/img/default.jpg")
                } else {
                    return `${Config.data.wallpaper.folderPath}/${Config.data.wallpaper.current}`
                }
            }

            Image {
                anchors.fill: parent
                source: root.wallpaperPath
                sourceSize {
                    width: parent.width
                    height: parent.height
                }
                asynchronous: true
                fillMode: Image.PreserveAspectCrop
                onStatusChanged: {
                    if (status == Image.Error) {
                        console.error("Failed to load background image")
                    }
                }
            }
        }
    }
}
