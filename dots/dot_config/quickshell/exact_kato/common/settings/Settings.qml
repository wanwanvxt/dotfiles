pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import qs.common.utils

Singleton {
    id: root

    readonly property string settingsPath: FileUtils.shellConfigPath("settings.json")
    readonly property alias data: _data
    readonly property int _readWriteDelay: 50

    function init() {
        Quickshell.execDetached(["sh", "-c", `mkdir -p "$(dirname "${settingsPath}")"`]);
    }

    Timer {
        id: _readTimer

        interval: root._readWriteDelay
        repeat: false
        onTriggered: _settingsFileView.reload()
    }
    Timer {
        id: _writeTimer

        interval: root._readWriteDelay
        repeat: false
        onTriggered: _settingsFileView.writeAdapter()
    }

    FileView {
        id: _settingsFileView

        path: root.settingsPath
        watchChanges: true
        onFileChanged: _readTimer.restart()
        onAdapterUpdated: _writeTimer.restart()
        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound)
                writeAdapter();
        }

        adapter: JsonAdapter {
            id: _data

            property SettWallpaper wallpaper: SettWallpaper {
                folderPath: `${FileUtils.xdgUserPictures}/wallpapers`
                current: ""
            }
        }
    }
}
