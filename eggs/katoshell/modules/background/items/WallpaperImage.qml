import QtQuick
import Quickshell
import qs.common.config

Image {
    readonly property string wallpaperPath: {
        if (Config.data.wallpaper.current == "" || Config.data.wallpaper.current.length == 0) {
            return Quickshell.shellPath("common/assets/img/default.jpg")
        } else {
            return `${Config.data.wallpaper.folderPath}/${Config.data.wallpaper.current}`
        }
    }

    anchors.fill: parent
    source: wallpaperPath
    sourceSize {
        width: width
        height: height
    }
    asynchronous: true
    fillMode: Image.PreserveAspectCrop
    onStatusChanged: {
        if (status == Image.Error) {
            console.error("Failed to load background image:", source)
        }
    }
}
