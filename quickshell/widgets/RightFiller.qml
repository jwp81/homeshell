import QtQuick

Rectangle {
    radius: 16
    color: Qt.rgba(1, 1, 1, 0.2)
    border { color: Qt.rgba(1, 1, 1, 0.5); width: 1 }

    Text {
        anchors.centerIn: parent
        text: "Left Widget"
        color: Qt.rgba(1, 1, 1, 0.25)
        font.pixelSize: 22
        font.family: "monospace"
    }
}