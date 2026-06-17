pragma Singleton

import Quickshell
import "./fuzzysort.js" as FZS

Singleton {
    function go(search: var, targets: var, options = null): var {
        return FZS.go(search, targets, options)
    }

    function prepare(target: var): var {
        return FZS.prepare(target)
    }
}
