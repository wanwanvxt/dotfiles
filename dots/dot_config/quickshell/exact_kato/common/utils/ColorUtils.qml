pragma Singleton

import QtQuick
import Quickshell

Singleton {
    function _clamp01(x: real): real {
        return Math.max(0, Math.min(x, 1));
    }

    function mix(c1: color, c2: color, percentage = 0.5): color {
        const p = _clamp01(percentage);

        const r = p * c1.r + (1 - p) * c2.r;
        const g = p * c1.g + (1 - p) * c2.g;
        const b = p * c1.b + (1 - p) * c2.b;
        const a = p * c1.a + (1 - p) * c2.a;
        return Qt.rgba(r, g, b, a);
    }

    function transparentize(c: color, percentage = 1): color {
        return Qt.rgba(c.r, c.g, c.b, c.a * (1 - percentage));
    }
}
