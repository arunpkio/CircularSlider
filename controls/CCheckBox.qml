import QtQuick 2.12
import QtQuick.Controls 2.12

CheckBox {
    id: control
    leftPadding: 0

    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: "#505050"
        color: "transparent"

        Rectangle {
            width: 12
            height: 12
            anchors.centerIn: parent
            radius: 3
            color: "#303030"
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "#fefefe"
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
