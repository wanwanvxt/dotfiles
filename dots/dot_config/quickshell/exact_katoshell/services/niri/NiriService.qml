pragma Singleton

import Niri
import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property bool ready: niriInstance.ready
    signal rawEventReceived(event: var)

    function _init() {
        niriInstance.connect()
    }

    function focusWorkspace(index: int) {
        niriInstance.focusWorkspace(index)
    }
    function focusWorkspaceById(id: int) {
        niriInstance.focusWorkspaceById(id)
    }
    function focusWorkspaceByName(name: string) {
        niriInstance.focusWorkspaceByName(name)
    }

    function focusWindow(id: int) {
        niriInstance.focusedWindow(id)
    }
    function closeWindow(id: int) {
        niriInstance.closeWindow(id)
    }
    function closeWindowOrFocused(id: int) {
        niriInstance.closeWindowOrFocused(id)
    }

    function toggleOverview() {
        niriInstance.toggleOverview()
    }

    function sendRawAction(args: list<string>) {
        if (ready && niriInstance.isConnected())
            Quickshell.execDetached(["niri", "msg", "action", ...args])
        else
            console.warn("Could not send action to Niri")
    }

    Niri {
        id: niriInstance

        property bool ready: false

        onConnected: ready = true
        onDisconnected: ready = false
        onErrorOccurred: error => console.warn("Niri socket error: ", error)
        onRawEventReceived: event => root.rawEventReceived(event)
    }
}
