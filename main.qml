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
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3

import "controls"
import "pages"

ApplicationWindow {
    id: root
    color: "#2e2e2e"
    width: 1080
    height: 720
    visible: true
    title: qsTr("QML Circular Slider Demo")

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    header: TabBar {
        id: bar
        width: parent.width
        spacing: 0
        CTabButton {
            text: qsTr("Basic Properties")
        }
        CTabButton {
            text: qsTr("Custom Handle")
        }
        CTabButton {
            text: "Custom Track and Progress"
        }
    }

    StackLayout {
        width: parent.width
        height: parent.height
        currentIndex: bar.currentIndex
        BasicPropertiesPage {
            id: homeTab
        }
        CustomHandlePage {
            id: discoverTab
        }
        CustomTrackAndProgressPage {
            id: activityTab
        }
    }


}
