/***************************************************************************
* Copyright (c) 2013 Abdurrahman AVCI <abdurrahmanavci@gmail.com>
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
* OR OTHER DEALINGS IN THE SOFTWARE.
*
***************************************************************************/

import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container
    color: "Violet"
    //width: 640
    //height: 480

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }

    /*
    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }
*/

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        //visible: primaryScreen

        Clock {
            id: clock
            anchors.margins: 5
            anchors.top: parent.top; anchors.right: parent.right

            color: "white"
            timeFont.family: "Oxygen"
            timeFont.pixelSize: 24
            dateFont.pixelSize: 32
        }

       Column {
            anchors.centerIn: parent
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                color: "black"
                verticalAlignment: Text.AlignVCenter
                height: text.implicitHeight
                width: parent.width
                text: textConstants.welcomeText.arg(sddm.hostName)
                wrapMode: Text.WordWrap
                font.pixelSize: 24
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
            }

        Rectangle {
            id: rectangle
            //border.color:"black"
            property int cbHeight: 100
            width: Math.max(600, mainRow.implicitWidth + 50)
            height: 2 * cbHeight + width * 2 / 3
            color: "transparent"
            TextAutoBox {
                id: squareButton
                property int cbHeight: parent.cbHeight
                //KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

            }
            Image {
                id: image
                width: parent.width
                height: parent.height
                source: "rectangle.png"
            }
        }

             Row {
                id: mainRow

                Column {
                    id: mainColumn

                    spacing: 12
                    Column {
                        //width: parent.width
                        anchors.fill: parent
                        width: 2*leftRectangle.implicitWidth
                        //                    height: Math.max(320, mainColumn.implicitHeight + 350)
                        height: 350   // , mainColumn.implicitHeight + 350)
                        //spacing: 4

                    }
                }
           }
        }
    }

    Component.onCompleted: {
        if (squareButton.textUserValue == "")
            squareButton.focus = true
        else
            password.focus = true
    }
}
