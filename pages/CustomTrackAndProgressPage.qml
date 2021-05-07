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
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.0

import "../controls"

Rectangle {
    id: trackAndProgressPage

    color: "#000000"

    Row {
        anchors.centerIn: parent
        spacing: 70

        CircularSlider {
            id: slider

            handleVerticalOffset: -30
            trackWidth: 5
            trackColor: "#FEFEFE"
            width: 400
            height: 400
            minValue: 0
            maxValue: 12
            value: 2
            snap: true
            stepSize: 1
            hideProgress: true
            hideTrack: true

            /// Custom Handle
            handle: Item {
                id: item

                width: 24
                height: 24

                Shape {
                    anchors.fill: parent
                    rotation: 180

                    ShapePath {
                        strokeWidth: 1
                        strokeColor: "#FF5555"
                        fillColor: "#FF5555"
                        startX: item.width / 2
                        startY: 0

                        PathLine { x: 0; y: item.height }
                        PathLine { x: item.width; y: item.height }
                        PathLine { x: item.width/2; y: 0 }
                    }
                }

                transform: Translate {
                    x: (slider.handleWidth - width) / 2
                    y: (slider.handleHeight - height) / 2
                }
            }


            Repeater {
                model: 6

                delegate: Rectangle {
                    anchors.centerIn: parent
                    height: slider.height
                    width: 1
                    color: "#191919"
                    transform: Rotation {
                        origin.x: 1
                        origin.y: slider.height / 2
                        angle: 30 * index
                    }
                }
            }

            /// Inner Trinagle
            Shape {
                id: triangle
                width: 30
                height: parent.height / 2 - 50
                x: (parent.width - width) / 2
                y: 50
                transform: Rotation {
                    origin.x: triangle.width / 2
                    origin.y: triangle.height
                    angle: slider.angle
                }

                ShapePath {
                    strokeWidth: 1
                    strokeColor: "#50FA7B"
                    fillColor: "#50FA7B"
                    startX: triangle.width / 2
                    startY: 0

                    PathLine { x: 0; y: triangle.height }
                    PathLine { x: triangle.width; y: triangle.height }
                    PathLine { x: triangle.width/2; y: 0 }
                }
            }

            /// Inner Circle
            Rectangle {
                color: "#232323"
                width: 120
                height: width
                radius: width / 2
                anchors.centerIn: parent

                Label {
                    anchors.centerIn: parent
                    font.pointSize: 42
                    color: "#FEFEFE"
                    text: slider.value === 0 ? Number(12) : Number(slider.value).toString().padStart(2, '0')
                }
            }

            /// Outer Dial
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "#fefefe"
                border.width: 4
                radius: width / 2
            }

            /// Numbers
            Label {
                text: "12"
                color: "#fefefe"
                font.pointSize: 16
                anchors.bottom: slider.top
                anchors.bottomMargin: 10
                x: slider.x + slider.width / 2 - width / 2
                z: 2
            }

            Label {
                text: "3"
                color: "#fefefe"
                font.pointSize: 16
                anchors.left: slider.right
                anchors.leftMargin: 10
                y: slider.y + slider.height / 2 - height / 2
                z: 2
            }

            Label {
                text: "6"
                color: "#fefefe"
                font.pointSize: 16
                anchors.top: slider.bottom
                anchors.topMargin: 10
                x: slider.x + slider.width / 2 - width / 2
                z: 2
            }

            Label {
                text: "9"
                color: "#fefefe"
                font.pointSize: 16
                anchors.right: slider.left
                anchors.rightMargin: 10
                y: slider.y + slider.height / 2 - height / 2
                z: 2
            }
        }

        CircularSlider {
            id: customSlider
            hideProgress: true
            hideTrack: true
            width: 400
            height: 400

            handleColor: "#6272A4"
            handleWidth: 32
            handleHeight: 32
            value: 0.3

            // Custom progress Indicator
            Item {
                anchors.fill: parent
                anchors.margins: 5
                Rectangle{
                    id: mask
                    anchors.fill: parent
                    radius: width / 2
                    color: "#282A36"
                    border.width: 5
                    border.color: "#44475A"
                }

                Item {
                    anchors.fill: mask
                    anchors.margins: 5
                    layer.enabled: true
                    rotation: 180
                    layer.effect: OpacityMask {
                        maskSource: mask
                    }
                    Rectangle {
                        height: parent.height * customSlider.value
                        width: parent.width
                        color:"#8BE9FD"
                    }
                }

                Label {
                    anchors.centerIn: parent
                    font.pointSize: 42
                    color: "#FEFEFE"
                    text: Number(customSlider.value * 100).toFixed() + "%"
                }
            }
        }
    }


}
