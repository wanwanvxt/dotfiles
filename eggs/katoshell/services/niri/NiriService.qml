pragma Singleton

import Quickshell
import Niri

Singleton {
    id: root

    readonly property alias ready: niriInstance.ready
    readonly property alias windows: niriInstance.windows
    readonly property alias workspaces: niriInstance.workspaces
    readonly property alias focusedWindow: niriInstance.focusedWindow

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
    function closeWindowOrFocused(id = 0) {
        niriInstance.closeWindowOrFocused(id)
    }

    function toggleOverview() {
        niriInstance.toggleOverview()
    }

    // niri msg action ??
    function sendAction(args: list<string>) {
        if (niriInstance.isConnected())
            Quickshell.execDetached(["niri", "msg", "action", ...args])
        else {
            console.warn("Could not send action to Niri")
        }
    }

    signal rawEventReceived(event: var)

    Niri {
        id: niriInstance

        property bool ready: false

        onConnected: {
            console.info("Connected to Niri socket")
            ready = true
        }
        onDisconnected: {
            console.info("Disconnected to Niri socket")
            ready = false
        }
        onErrorOccurred: error => console.warn("Niri socket error:", error)
        onRawEventReceived: (event) => root.rawEventReceived(event)
    }
}
