//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic
//@ pragma Env QT_QUICK_FLICKABLE_WHEEL_DECELERATION=10000

import QtQuick
import Quickshell
import qs.common.theme
import qs.services.apps
import qs.services.niri

ShellRoot {
    id: root

    readonly property bool ready: rootInternal.initialized

    QtObject {
        id: rootInternal

        property bool initialized: false
    }

    Component.onCompleted: {
        Theme._init()
        NiriService._init()
        AppsService._init()
        rootInternal.initialized = true
    }

    Loader {
        active: root.ready
        sourceComponent: null
    }

    LazyLoader {
        active: root.ready
    }
}
