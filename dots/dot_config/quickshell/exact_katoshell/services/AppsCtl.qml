pragma Singleton

import QtQuick
import Quickshell
import qs.utils

Singleton {
    QtObject {
        id: rootInternal

        readonly property list<var> preparedDesktopEntries: [...DesktopEntries.applications.values].sort(
            (a, b) => (a.name.localeCompare(b.name))
        ).map(entry => ({
            name: Fuzzysort.prepare(entry.name),
            entry: entry
        }))

        readonly property list<var> preparedKnownIcons: DesktopEntries.applications.values.map(
            entry => Fuzzysort.prepare(entry.icon)
        )
        readonly property list<var> preparedKnownIconsById: DesktopEntries.applications.values.map(
            entry => ({
                id: Fuzzysort.prepare(entry.id),
                icon: entry.icon
            })
        )

        function isIconExist(str: string): bool {
            if (!str || (str.length == 0)) return false
            return Quickshell.iconPath(str, true).length > 0
        }
    }

    function _init() {}

    function guesIcon(str: string): string {
        if (rootInternal.isIconExist(str)) return str

        const knownIcons = Fuzzysort.go(str, rootInternal.preparedKnownIcons, { threshold: 0.8 })
        if ((knownIcons.length > 0) && rootInternal.isIconExist(knownIcons[0].target))
            return knownIcons[0].target

        const knownIconsById = Fuzzysort.go(str, rootInternal.preparedKnownIconsById, { threshold: 0.8, key: "id" })
        if ((knownIconsById.length > 0) && rootInternal.isIconExist(knownIconsById[0].target))
            return knownIconsById[0].obj.icon

        return str
    }

    function search(str: string): var {
        return Fuzzysort.go(str, rootInternal.preparedDesktopEntries, {
            threshold: 0.5,
            all: true,
            key: "name"
        })
    }
}
