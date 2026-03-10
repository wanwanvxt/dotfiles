pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool wallSelector: false
    signal wallSelectorOpened(value: bool)
    onWallSelectorChanged: root.wallSelectorOpened(wallSelector)

    function init() {
    // placeholder
    }

    IpcHandler {
        target: "wallSelector"

        function toggle() {
            root.wallSelector = !root.wallSelector;
        }
        function open() {
            root.wallSelector = true;
        }
        function close() {
            root.wallSelector = false;
        }
    }
}
