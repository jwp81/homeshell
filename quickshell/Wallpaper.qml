import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    anchors { top: true; bottom: true; left: true; right: true }
    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    color: "black"

    Image {
        anchors.fill: parent
        source: Qt.resolvedUrl("assets/wall.jpg")
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
    }
}