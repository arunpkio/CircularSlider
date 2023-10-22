/*************************************************************************************
The MIT License (MIT)

Copyright (c) 2021 Arun Pk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
************************************************************************************/

import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform as LAB

import "../controls"

Item {
    id: basicPage

    QtObject {
        id: sliderProperties

        property int trackWidth: 20
        property int progressWidth: 20
        property int handleWidth: 22
        property int handleHeight: 22
        property int handleRadius: 11
        property int handleVerticalOffset: 0

        property real startAngle: 0
        property real endAngle: 360
        property real minValue: 0
        property real maxValue: 100

        property color trackColor: "#505050"
        property color progressColor: "#3a4ec4"
        property color handleColor: "#fefefe"

        property bool snap: false
        property real stepSize: 10
        property bool hideTrack: false
        property bool hideProgress: false
    }

    RowLayout {
        anchors.fill: parent
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            CircularSlider {
                id: circularSlider
                anchors.centerIn: parent

                width: 300
                height: 300

                trackWidth: sliderProperties.trackWidth
                progressWidth: sliderProperties.progressWidth
                handleWidth: sliderProperties.handleWidth
                handleHeight: sliderProperties.handleHeight
                handleRadius: sliderProperties.handleRadius
                handleVerticalOffset: sliderProperties.handleVerticalOffset

                startAngle: sliderProperties.startAngle
                endAngle: sliderProperties.endAngle
                minValue: sliderProperties.minValue
                maxValue: sliderProperties.maxValue
                snap: sliderProperties.snap
                stepSize: 5
                value: 10

                handleColor: sliderProperties.handleColor
                trackColor: sliderProperties.trackColor
                progressColor: sliderProperties.progressColor

                hideTrack: sliderProperties.hideTrack
                hideProgress: sliderProperties.hideProgress

                CLabel {
                    anchors.centerIn: parent
                    text: Number(circularSlider.value).toFixed()
                    rotation: -circularSlider.rotation
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: 300
            color: "#3e3e3e"
            Layout.margins: 10
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 10

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Flickable {
                        anchors.fill: parent
                        width: parent.width
                        contentHeight: pane.implicitHeight
                        clip: true
                        Pane {
                            id: pane
                            padding: 5
                            width: 300
                            background: Rectangle {
                                color: "transparent"
                            }

                            ColumnLayout {
                                width: parent.width
                                spacing: 0

                                CLabel {
                                    text: "Track Width"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 50
                                    value: sliderProperties.trackWidth
                                    onValueChanged: sliderProperties.trackWidth = value
                                }

                                CLabel {
                                    text: "Progress Width"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 50
                                    value: sliderProperties.progressWidth
                                    onValueChanged: sliderProperties.progressWidth = value
                                }

                                CLabel {
                                    text: "Handle Width"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 50
                                    value: sliderProperties.handleWidth
                                    onValueChanged: sliderProperties.handleWidth = value
                                }

                                CLabel {
                                    text: "Handle Height"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 50
                                    value: sliderProperties.handleHeight
                                    onValueChanged: sliderProperties.handleHeight = value
                                }

                                CLabel {
                                    text: "Handle Radius"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 50
                                    value: sliderProperties.handleRadius
                                    onValueChanged: sliderProperties.handleRadius = value
                                }

                                CLabel {
                                    text: "Handle Offset"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: -30
                                    to: 30
                                    value: sliderProperties.handleVerticalOffset
                                    onValueChanged: sliderProperties.handleVerticalOffset = value
                                }

                                CLabel {
                                    text: "Rotation"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 360
                                    stepSize: 10
                                    value: circularSlider.rotation
                                    onValueChanged: circularSlider.rotation = value
                                }

                                CLabel {
                                    text: "Start Angle"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 360
                                    stepSize: 10
                                    value: sliderProperties.startAngle
                                    onValueChanged: sliderProperties.startAngle = value
                                }

                                CLabel {
                                    text: "End Angle"
                                }

                                CSlider {
                                    Layout.fillWidth: true
                                    from: 0
                                    to: 360
                                    stepSize: 10
                                    value: sliderProperties.endAngle
                                    onValueChanged: sliderProperties.endAngle = value
                                }

                                Row {
                                    spacing: 10
                                    Layout.alignment: Qt.AlignVCenter

                                    Rectangle {
                                        width: 16
                                        height: 16
                                        radius: 5
                                        color: sliderProperties.trackColor

                                        LAB.ColorDialog {
                                            id: colorDialog
                                            title: "Please choose a color"
                                            property var callFunc
                                            onAccepted: sliderProperties.trackColor = colorDialog.color
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                colorDialog.color = sliderProperties.trackColor
                                                colorDialog.open()
                                            }
                                        }
                                    }

                                    CLabel {
                                        text: "Track Color"
                                    }
                                }

                                Item { Layout.preferredHeight: 10 }

                                Row {
                                    spacing: 10
                                    Layout.alignment: Qt.AlignVCenter

                                    Rectangle {
                                        width: 16
                                        height: 16
                                        radius: 5
                                        color: sliderProperties.progressColor

                                        LAB.ColorDialog {
                                            id: colorDialog2
                                            title: "Please choose a color"
                                            property var callFunc
                                            onAccepted: sliderProperties.progressColor = colorDialog2.color
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                colorDialog2.color = sliderProperties.progressColor
                                                colorDialog2.open()
                                            }
                                        }
                                    }

                                    CLabel {
                                        text: "Progress Color"
                                    }
                                }

                                Item { Layout.preferredHeight: 10 }

                                Row {
                                    spacing: 10
                                    Layout.alignment: Qt.AlignVCenter

                                    Rectangle {
                                        width: 16
                                        height: 16
                                        radius: 5
                                        color: sliderProperties.handleColor

                                        LAB.ColorDialog {
                                            id: colorDialog3
                                            title: "Please choose a color"
                                            property var callFunc
                                            onAccepted: sliderProperties.handleColor = colorDialog3.color
                                        }

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                colorDialog3.color = sliderProperties.handleColor
                                                colorDialog3.open()
                                            }
                                        }
                                    }

                                    CLabel {
                                        text: "Handle Color"
                                    }
                                }

                                CCheckBox {
                                    id: snapCheckBox
                                    text: "Snap Mode"
                                    onCheckedChanged: sliderProperties.snap = checked
                                }

                                Row {
                                    spacing: 10
                                    Layout.alignment: Qt.AlignVCenter

                                    CCheckBox {
                                        id: hideTrackCheckBox
                                        text: "Hide Track"
                                        onCheckedChanged: sliderProperties.hideTrack = checked
                                    }

                                    CCheckBox {
                                        id: hideProgressCheckBox
                                        text: "Hide Progress"
                                        onCheckedChanged: sliderProperties.hideProgress = checked
                                    }
                                }
                            }
                        }

                        ScrollBar.vertical: ScrollBar { }
                    }
                }
            }
        }
    }
}
