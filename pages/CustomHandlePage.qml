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

import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.14
import QtQuick.Shapes 1.14

import "../controls"

Item {
    id: handlePage

    property real newVal: 10

    RowLayout {
        anchors.centerIn: parent
        spacing: 50

        ColumnLayout {
            spacing: 10
            CircularSlider {
                id: sldier
                value: handlePage.newVal
                onValueChanged: handlePage.newVal = value
                width: 300
                height: 300
                minValue: 0
                maxValue: 120

                handle: Rectangle {
                    id: handleItem
                    transform: Translate {
                        x: (sldier.handleWidth - width) / 2
                        y: (sldier.handleHeight - height) / 2
                    }
                    width: 40
                    height: 40
                    radius: width / 2
                    antialiasing: true
                    color: "#908990"

                    border.color: "#fefefe"
                    border.width: 5
                }

                Label {
                    anchors.centerIn: parent
                    font.pointSize: 26
                    color: "#FEFEFE"
                    text: Number(sldier.value).toFixed()
                }
            }

            CLabel {
                text: "Circle as custom handle with a \nborder width of 5"
                horizontalAlignment: Qt.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        ColumnLayout {
            spacing: 10
            CircularSlider {
                id: sldier2
                value: handlePage.newVal
                onValueChanged: handlePage.newVal = value
                width: 300
                height: 300
                startAngle: 40
                endAngle: 320
                rotation: 180
                trackWidth: 5
                progressWidth: 20
                minValue: 0
                maxValue: 120
                progressColor: "#50FA7B"
                capStyle: Qt.FlatCap

                handle: Rectangle {
                    transform: Translate {
                        x: (sldier2.handleWidth - width) / 2
                        y: sldier2.handleHeight / 2
                    }

                    width: 10
                    height: sldier2.height / 2
                    color: "#FFac89"
                    radius: width / 2
                    antialiasing: true
                }

                Label {
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: -40
                    rotation: 180
                    font.pointSize: 26
                    color: "#FEFEFE"
                    text: Number(sldier2.value).toFixed()
                }
            }
            CLabel {
                text: "Rectangle as a handle with custom \ntranslated position.\nAlso with startAngle: 40, endAngle: 320 \nand rotation: 180"

                horizontalAlignment: Qt.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }

        ColumnLayout {
            spacing: 10
            CircularSlider {
                id: sldier3
                trackWidth: 5
                handleVerticalOffset: -24
                progressWidth: 20
                progressColor: "#FF5555"
                width: 300
                height: 300

                minValue: 0
                maxValue: 12
                value: 2
                snap: true
                stepSize: 1

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
                            startX: item.width/2
                            startY: 0
                            PathLine { x: 0; y: item.height }
                            PathLine { x: item.width; y: item.height }
                            PathLine { x: item.width/2; y: 0 }
                        }
                    }
                    transform: Translate {
                        x: (sldier3.handleWidth - width) / 2
                        y: (sldier3.handleHeight - height) / 2
                    }
                }

                Label {
                    anchors.centerIn: parent
                    font.pointSize: 26
                    color: "#FEFEFE"
                    text: Number(sldier3.value).toFixed()
                }
            }
            CLabel {
                text: "Trinagle shape as handle with handleOffset \nset to -24 and snap enabled with \nstepSize of 1"
                horizontalAlignment: Qt.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
