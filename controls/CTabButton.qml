import QtQuick 2.14
import QtQuick.Controls 2.14

TabButton {
    id: control
    padding: 0

    contentItem: Text {
        text: control.text
        font: control.font
        color: "#fefefe"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: control.checked ? "#303030" : "#353637"
    }

    Rectangle {
        width: parent.width
        height: 3
        anchors.bottom: parent.bottom
        visible: control.checked
        color: "beige"
    }
}

