pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    QtObject {
        id: rootInternal

        property string currentPopupOpen: ""
    }

    function _init() {}

    function isOpen(wnd: string): bool {
        return wnd == rootInternal.currentPopupOpen
    }
    function open(wnd: string) {
        if (!isOpen(wnd)) rootInternal.currentPopupOpen = wnd
    }
    function close(wnd: string) {
        if (isOpen(wnd)) rootInternal.currentPopupOpen = ""
    }
    function toggle(wnd: string) {
        if (isOpen(wnd)) close(wnd)
        else open(wnd)
    }

    IpcHandler {
        target: "wndPopup"

        function open(wnd: string) {
            root.open(wnd)
        }
        function close(wnd: string) {
            root.close(wnd)
        }
        function toggle(wnd: string) {
            root.toggle(wnd)
        }
    }
}
