import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.common.settings
import qs.common.utils

Scope {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: root
            required property ShellScreen modelData
            readonly property string defaultWall: FileUtils.shellAssetsPath("img/default.png")
            screen: modelData
            exclusionMode: ExclusionMode.Ignore
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }
            color: "transparent"

            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.namespace: "kato.wallpaper"

            Image {
                source: `${Settings.data.wallpaper.folderPath}/${Settings.data.wallpaper.current}`
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                anchors.fill: parent
                asynchronous: true
                fillMode: Image.PreserveAspectCrop
                onStatusChanged: {
                    if (source !== root.defaultWall) {
                        if (status === Image.Error)
                            source = root.defaultWall;
                    }
                }
            }
        }
    }
}
