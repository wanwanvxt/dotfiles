pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function _init() {}

    FontInfo {
        id: fontInfo
    }

    readonly property string fontFamily: fontInfo.font.family
    readonly property ThemeSizes fontSizes: ThemeSizes {
        xxs: xs * 5/6
        xs: sm * 5/6
        sm: md * 5/6
        md: fontInfo.font.pointSize
        lg: md * 6/5
        xl: lg * 6/5
        xxl: xl * 6/5
        xxxl: xxl * 6/5
    }
    readonly property ThemeSizes iconSizes: ThemeSizes {
        xxs: md * 1/4
        xs: md * 2/4
        sm: md * 3/4
        md: 24
        lg: md * 5/4
        xl: md * 6/4
        xxl: md * 7/4
        xxxl: xxl * 8/4
    }
    readonly property ThemeColors colors: ThemeColors {
        background: "#262626"
        text: "#f2f2f2"
        subtext: "#acacac"
        accent: "#00ff99"
    }
}
