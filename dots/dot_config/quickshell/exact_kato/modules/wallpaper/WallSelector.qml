pragma ComponentBehavior: Bound

import Qt.labs.folderlistmodel
import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import Quickshell.Widgets
import qs.common.global
import qs.common.settings
import qs.common.style
import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens
        delegate: PanelWindow {
            id: root

            required property ShellScreen modelData
            screen: modelData
            implicitWidth: _windowContent.width
            implicitHeight: _windowContent.height
            exclusionMode: ExclusionMode.Ignore
            color: "transparent"
            visible: GlobalStates.wallSelector

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "kato.wallSelector"
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

            HyprlandFocusGrab {
                windows: [root]
                active: root.visible
                onCleared: GlobalStates.wallSelector = false
            }

            KPaddingRectItem {
                id: _windowContent

                implicitWidth: _wallListView.chooseItemWidth * 1.5 + padding * 2
                implicitHeight: _wallListView.chooseItemHeight + padding * 2
                padding: Style.spacing.md
                radius: Style.rounding.sm
                color: Style.colors.background

                ClippingRectangle {
                    radius: parent.radius - parent.padding
                    color: "transparent"

                    ListView {
                        id: _wallListView

                        readonly property real chooseItemWidth: root.screen.width * 0.6
                        readonly property real chooseItemHeight: root.screen.height * 0.6
                        anchors.fill: parent
                        contentWidth: contentItem.width
                        contentHeight: height
                        focus: root.visible
                        orientation: ListView.Horizontal
                        snapMode: ListView.SnapToItem
                        spacing: Style.spacing.md
                        currentIndex: 0
                        preferredHighlightBegin: (width - chooseItemWidth) / 2
                        preferredHighlightEnd: (width + chooseItemWidth) / 2
                        highlightRangeMode: ListView.ApplyRange
                        highlightMoveDuration: 300
                        onFocusChanged: {
                            if (!focus)
                                currentIndex = 0;
                        }

                        interactive: false
                        keyNavigationEnabled: false
                        Keys.onPressed: event => {
                            switch (event.key) {
                            case Qt.Key_Left:
                            case Qt.Key_H:
                            case Qt.Key_Backtab:
                                _wallListView.decrementCurrentIndex();
                                break;
                            case Qt.Key_Right:
                            case Qt.Key_L:
                            case Qt.Key_Tab:
                                _wallListView.incrementCurrentIndex();
                                break;
                            case Qt.Key_Enter:
                            case Qt.Key_Space:
                                const fileName = _wallListView.model.get(_wallListView.currentIndex, "fileBaseName");
                                Settings.data.wallpaper.current = fileName;
                                break;
                            }
                        }

                        model: FolderListModel {
                            folder: Qt.resolvedUrl(Settings.data.wallpaper.folderPath)
                            nameFilters: ["*.png", "*.jpg", "*.jpeg", "*.webp", "*.svg"]
                            showDirs: false
                        }
                        delegate: WallChooseItem {
                            required property int index
                            required property var modelData
                            imageSource: modelData.filePath
                            selected: ListView.view.currentIndex === index
                            width: _wallListView.chooseItemWidth
                            height: _wallListView.chooseItemHeight
                        }
                    }
                }
            }
        }
    }
}
