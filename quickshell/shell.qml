import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "widgets"

ShellRoot {
    Wallpaper {}

    PanelWindow {
        anchors { top: true; bottom: true; left: true; right: true }
        WlrLayershell.layer: WlrLayer.Bottom
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        color: "transparent"

        RowLayout {
    anchors.fill: parent
    anchors.margins: 20
    spacing: 16

    LeftFiller {
        Layout.fillWidth: true   // ← both sides now share space equally
        Layout.fillHeight: true
    }

    ColumnLayout {
        Layout.fillWidth: true   // ← was Layout.preferredWidth: 320
        Layout.fillHeight: true
        spacing: 16

        ClockGreeter { Layout.fillWidth: true; Layout.fillHeight: true }
        RightFiller { Layout.fillWidth: true; Layout.fillHeight: true }
        RightFiller { Layout.fillWidth: true; Layout.fillHeight: true }
    }
}
    }
}