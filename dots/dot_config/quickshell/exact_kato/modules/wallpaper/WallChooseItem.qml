import QtQuick
import qs.common.style

Item {
    id: root

    required property string imageSource
    required property bool selected

    Image {
        id: _image

        source: root.imageSource
        anchors.fill: parent
        sourceSize.width: parent.width
        sourceSize.height: parent.height
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.fill: parent
        color: Style.colors.surface_container_low
        opacity: (_image.status === Image.Ready) ? (root.selected ? 0 : 0.8) : 1

        Behavior on opacity {
            NumberAnimation {
                duration: 300
                easing.type: Easing.InQuad
            }
        }
    }
}
