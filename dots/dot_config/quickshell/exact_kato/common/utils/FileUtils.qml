pragma Singleton

import QtCore
import Quickshell

Singleton {
    readonly property string xdgConfigHome: trimFileProtocol(StandardPaths.standardLocations(StandardPaths.ConfigLocation)[0])
    readonly property string xdgUserPictures: trimFileProtocol(StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0])

    function shellConfigPath(str: string): string {
        if (str)
            return `${xdgConfigHome}/kato/${str}`;
        return `${xdgConfigHome}/kato`;
    }
    function shellAssetsPath(str: string): string {
        if (str)
            return Quickshell.shellPath(`assets/${str}`);
        return Quickshell.shellPath("assets");
    }

    function trimFileProtocol(str: string): string {
        return str.startsWith("file://") ? str.slice(7) : str;
    }

    function filename(path: string): string {
        const idx = Math.max(path.lastIndexOf("/"), path.lastIndexOf("//"));
        return path.substring(idx + 1);
    }
}
