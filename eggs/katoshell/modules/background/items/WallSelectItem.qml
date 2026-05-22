import QtQuick
import QtQuick.Effects
import Quickshell.Widgets
import qs.common.theme

ClippingRectangle {
    id: root

    required property string source
    required property bool selected
    required property real itemWidth
    required property real itemHeight

    width: selected ? itemWidth : itemWidth * 0.25
    height: itemHeight
    border {
        width: 1
        color: Theme.colors.muted
    }

    MultiEffect {
        source: parent
        anchors.fill: parent
        shadowColor: Theme.colors.surface
    }

    Image {
        id: image

        anchors.centerIn: parent
        width: root.itemWidth
        height: root.itemHeight
        source: root.source
        sourceSize {
            width: width
            height: height
        }
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error) {
                console.error("Failed to load image:", source)
            }
        }

        Rectangle {
            anchors.fill: parent
            color: Theme.colors.base
            opacity: (image.status == Image.Ready) ? 0 : 1

            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InQuad
                }
            }
        }
    }
}
