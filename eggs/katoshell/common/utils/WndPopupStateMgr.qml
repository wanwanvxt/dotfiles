pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    QtObject {
        id: rootInternal

        property string currentWindowPopup
        onCurrentWindowPopupChanged: console.log(currentWindowPopup)
    }

    function _init() {
        rootInternal.currentWindowPopup = ""
        const windows = ["wallSelector"]
        for (const wnd of windows) {
            ipcHandlerFactory.createObject(root, { "target": wnd })
        }
    }

    function isOpen(wnd: string): bool {
        return wnd == rootInternal.currentWindowPopup
    }
    function open(wnd: string) {
        if (!isOpen(wnd)) {
            rootInternal.currentWindowPopup = wnd
        }
    }
    function close(wnd: string) {
        if (isOpen(wnd)) {
            rootInternal.currentWindowPopup = ""
        }
    }
    function toggle(wnd: string) {
        if (isOpen(wnd)) {
            close(wnd)
        } else {
            open(wnd)
        }
    }

    Component {
        id: ipcHandlerFactory

        IpcHandler {
            function open() {
                root.open(target)
            }
            function close() {
                root.close(target)
            }
            function toggle() {
                root.toggle(target)
            }
        }
    }
}
