pragma Singleton

import QtCore
import QtQuick
import Quickshell
import Quickshell.Io
import qs.common.utils

Singleton {
    id: root

    readonly property alias data: configData

    QtObject {
        id: rootInternal

        property string xdgConfigHomePath: FileUtils.trimFileProtocol(StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0])
        property string xdgUserPicturesPath: FileUtils.trimFileProtocol(StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0])
        property string configPath: `${xdgConfigHomePath}/katoshell/config.json`
        property int readWriteDelay: 50
    }

    function _init() {
        Quickshell.execDetached(["mkdir", "-p", `${rootInternal.xdgConfigHomePath}/katoshell`])
    }

    function resetDefault() {
        data.wallpaper.folderPath = `${rootInternal.xdgUserPicturesPath}/wallpapers`
        data.wallpaper.current = ""
        configFileView.writeAdapter()
    }

    Timer {
        id: configReadTimer

        interval: rootInternal.readWriteDelay
        repeat: false
        onTriggered: configFileView.reload()
    }
    Timer {
        id: configWriteTimer

        interval: rootInternal.readWriteDelay
        repeat: false
        onTriggered: configFileView.writeAdapter()
    }

    FileView {
        id: configFileView

        path: rootInternal.configPath
        watchChanges: true
        onFileChanged: configReadTimer.restart()
        onAdapterUpdated: configWriteTimer.restart()
        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound) {
                root.resetDefault()
            }
        }

        adapter: JsonAdapter {
            id: configData

            property WallpaperCfg wallpaper: WallpaperCfg {}
        }
    }
}
