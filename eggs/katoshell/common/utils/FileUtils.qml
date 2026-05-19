pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function trimFileProtocol(str: string): string {
        return str.startsWith("file://") ? str.slice(7) : str;
    }
}
