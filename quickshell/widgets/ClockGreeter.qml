import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Io

Rectangle {
    id: root
    property Item wallpaperItem: null
    property string username: "user"
    radius: 16
    color: "transparent"
    layer.enabled: true

    // grab $USER from the environment
    Process {
        command: ["sh", "-c", "echo -n $USER"]
        running: true
        stdout: SplitParser {
            onRead: line => root.username = line
        }
    }

    // blur — same pattern as the fillers
    ShaderEffectSource {
        id: src
        sourceItem: root.wallpaperItem
        sourceRect: {
            var pos = root.mapToItem(root.wallpaperItem, 0, 0)
            return Qt.rect(pos.x, pos.y, root.width, root.height)
        }
        anchors.fill: parent
        visible: false
    }

    MultiEffect {
        source: src
        anchors.fill: parent
        blurEnabled: true
        blur: 1.0
        blurMax: 64
    }

    // subtle tint, no border
    Rectangle {
        anchors.fill: parent
        radius: parent.radius
        color: Qt.rgba(1, 1, 1, 0.05)
    }

    // tick every second
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.now = new Date()
    }

    RowLayout {
        anchors.centerIn: parent
        spacing: 20

        // ── big clock ──────────────────────────────
        Text {
            id: clock
            property var now: new Date()
            text: Qt.formatTime(now, "HH:mm")
            font.pixelSize: 120
            font.weight: Font.Thin
            color: "white"
        }

        // ── divider ────────────────────────────────
        Rectangle {
            width: 1
            height: 70
            color: Qt.rgba(1, 1, 1, 0.18)
            Layout.alignment: Qt.AlignVCenter
        }

        // ── greeter + date ─────────────────────────
        ColumnLayout {
            spacing: 6
            Layout.alignment: Qt.AlignVCenter

            Text {
                property int h: clock.now.getHours()
                text: {
                    if (h >= 4  && h < 11) return "good morning, " + root.username + "!"
                    if (h >= 11 && h < 18) return "hi, " + root.username + "!"
                    if (h >= 18 && h < 21) return "good evening, " + root.username + "!"
                    return "get some rest :)"
                }
                font.pixelSize: 32
                font.weight: Font.Light
                color: Qt.rgba(1, 1, 1, 0.9)
            }

            Text {
                text: Qt.formatDate(clock.now, "dddd, d MMMM")
                font.pixelSize: 28
                font.weight: Font.Light
                color: Qt.rgba(1, 1, 1, 0.45)
            }
        }
    }
}