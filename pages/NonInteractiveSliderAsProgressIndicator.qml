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
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import QtQuick.Shapes

import "../controls"

Item {
    id: sliderAsProgressIndicatorPage

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Row {
            Layout.fillWidth: true
            spacing: 50

            CircularSlider {
                id: progressIndicator
                hideProgress: true
                hideTrack: true
                width: 300
                height: 300

                interactive: false
                value: inputSlider.value

                Repeater {
                    model: 72

                    Rectangle {
                        id: indicator
                        width: 5
                        height: 20
                        radius: width / 2
                        color: indicator.angle > progressIndicator.angle ? "#16171C" : "#7CFF6E"
                        readonly property real angle: index * 5
                        transform: [
                            Translate {
                                x: progressIndicator.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: progressIndicator.width / 2
                                origin.y: progressIndicator.height / 2
                                angle: indicator.angle
                            }
                        ]
                    }
                }
            }

            CircularSlider {
                id: progressIndicator1
                hideProgress: true
                hideTrack: true
                width: 300
                height: 300

                interactive: false
                value: inputSlider.value

                Repeater {
                    model: 36

                    Rectangle {
                        id: indicator1
                        width: 16
                        height: 16
                        radius: width / 2
                        color: indicator1.angle > progressIndicator.angle ? "#16171C" : "#8265FE"
                        readonly property real angle: index * 10
                        transform: [
                            Translate {
                                x: progressIndicator.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: progressIndicator.width / 2
                                origin.y: progressIndicator.height / 2
                                angle: indicator1.angle
                            }
                        ]
                    }
                }
            }
        }

        Slider {
            id: inputSlider
            from: 0.0
            to: 1.0
            Layout.fillWidth: true
        }
    }
}
