//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic
//@ pragma Env QT_QUICK_FLICKABLE_WHEEL_DECELERATION=10000

import QtQuick
import Quickshell
import qs.common.global
import qs.common.settings
import qs.modules.wallpaper

ShellRoot {
    id: root

    property bool initialized: false

    Component.onCompleted: {
        Settings.init();
        GlobalStates.init();
        initialized = true;
    }

    Loader {
        active: root.initialized
        sourceComponent: Component {
            Wallpaper {}
        }
    }

    LazyLoader {
        active: root.initialized
        Component {
            WallSelector {}
        }
    }
}
