pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.common.settings
import qs.common.utils

Scope {
    id: root

    readonly property string defaultWall: FileUtils.shellAssetsPath("img/default.png")

    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            required property ShellScreen modelData
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
