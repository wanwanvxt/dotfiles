pragma ComponentBehavior: Bound

import Qt.labs.folderlistmodel
import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import qs.common.config
import qs.common.utils
import qs.modules.background.items

Scope {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: root
            required property ShellScreen modelData
            screen: modelData
            exclusionMode: ExclusionMode.Ignore
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "katoshell.wallSelector"
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
            color: "transparent"
            visible: WndPopupStateMgr.isOpen("wallSelector")

            Item {
                id: rootContent
                anchors.fill: parent

                WallpaperImage {
                    id: wallImage
                    visible: false
                }
                MultiEffect {
                    source: wallImage
                    anchors.fill: wallImage
                    autoPaddingEnabled: false
                    blurEnabled: true
                    blur: 1
                    blurMax: 48
                }

                Loader {
                    anchors.fill: parent
                    active: root.visible

                    sourceComponent: Item {
                    anchors.fill: parent

                        Component.onCompleted: {
                            wallListView.forceActiveFocus()
                        }

                        ListView {
                            id: wallListView

                            readonly property real itemWidth: root.screen.width * 0.6
                            readonly property real itemHeight: root.screen.height * 0.6

                            width: parent.width
                            height: itemHeight
                            anchors.centerIn: parent
                            focus: true
                            orientation: ListView.Horizontal
                            snapMode: ListView.SnapToItem
                            currentIndex: 0
                            contentWidth: contentItem.width
                            contentHeight: height
                            spacing: 10
                            preferredHighlightBegin: (width - itemWidth) / 2
                            preferredHighlightEnd: (width - itemWidth) / 2 + itemWidth
                            highlightRangeMode: ListView.StrictlyEnforceRange
                            highlightMoveDuration: 300

                            onFocusChanged: {
                                if (!focus) {
                                    currentIndex = 0
                                }
                            }

                            interactive: false
                            keyNavigationEnabled: false
                            Keys.onPressed: event => {
                                switch (event.key) {
                                    case Qt.Key_Left:
                                    case Qt.Key_H:
                                    case Qt.Key_Backtab:
                                        wallListView.decrementCurrentIndex()
                                        break
                                    case Qt.Key_Right:
                                    case Qt.Key_L:
                                    case Qt.Key_Tab:
                                        wallListView.incrementCurrentIndex()
                                        break
                                    case Qt.Key_Enter:
                                    case Qt.Key_Space:
                                        const filename = wallListView.model.get(wallListView.currentIndex, "fileBaseName")
                                        Config.data.wallpaper.current = filename
                                        break
                                }
                            }

                            model: FolderListModel {
                                folder: Qt.resolvedUrl(Config.data.wallpaper.folderPath)
                                nameFilters: ["*.png", "*.jpg", "*.jpeg", "*.webp", "*.svg"]
                                showDirs: false
                            }
                            delegate: WallSelectItem {
                                required property int index
                                required property var modelData

                                source: modelData.filePath
                                selected: ListView.view.currentIndex == index
                                itemWidth: wallListView.itemWidth
                                itemHeight: wallListView.itemHeight
                            }
                        }
                    }
                }
            }
        }
    }
}
