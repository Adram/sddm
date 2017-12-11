import QtQuick 2.0

FocusScope {
    id: root

    property string textUserValue
    property string textUserPassword
    property bool indexIsNew: false
    property bool unameSelected: false
    property int vMargin: 35
    property int hMargin: 30
    property int sbHeight: 8

    width: parent.width
    height: parent.height
    z:200

    Component {
        id: listViewItem

        Rectangle {
            id: wrapper
            width: listV_user.height - 8
            height: listV_user.height/5
            property string tmpUsername: ListView.isCurrentItem ? contactInfo.text : ""
            property bool mouse_click
            color: (index % 2)? "#f5f5f5" : "white"

            focus: false

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listV_user.currentIndex = index
                    item.DelegateModel.inSelected = !item.DelegateModel.inSelected
                    contactInfo.focus = true
                    scope.focus = true
                    wrapper.mouse_click = true
                    unameSelected = true
                    username.text = completion.text
                }
            }

            Row {
                anchors {
                    left: parent.left; leftMargin: 8
                    right: parent.right; rightMargin: 8
                    verticalCenter: parent.verticalCenter
                }
                Image {
                    id: userIcon
                    fillMode: Image.PreserveAspectCrop
                    source: loadIcons ? localPath + "images/" + name + ".png": ""
                    onStatusChanged: {
                        if (loadIcons) {
                            if (status == Image.Error && source != localPath + "images/user_icon.png")
                                source = localPath + "images/user_icon.png"
                        }
                    }
                }

                Column {


                    Text {
                        id: contactInfo

                        focus: true
                        text: name
                        font { pixelSize: 16; bold: true; italic: false}
                        color: wrapper.ListView.isCurrentItem ? "black" : "gray"
                    }

                    Text {
                        width: 200
                        id: realNameField
                        text: realName
                        color: wrapper.ListView.isCurrentItem ? "gray" : "black"
                    }
                }
            }

        }
    }

    Row {
        id: listRow
        anchors {
            top: parent.top; topMargin: vMargin
            left: parent.left; leftMargin: hMargin
        }
        width:parent.width
        spacing: 0

        ListView {
            id: listV_user
            property bool stato_indice_scroll: false
            width: root.width / 3;
            height: image.height - 2 * vMargin - cbHeight
            maximumFlickVelocity: 1500

            clip: true

            model: mySortModel
            delegate: listViewItem
            spacing: 0

            onCurrentItemChanged: {
                if (currentItem) {
                    completion.text = currentItem.tmpUsername
                }
            }
            onCurrentIndexChanged: {
                console.log("ListView - CurrentIndexChanged! - Current: "+currentIndex+" ActiveFocus: "+activeFocus)
                stato_indice_scroll = true
                stato_indice_scroll = false
                if (currentIndex == -1) {
                    completion.text = ""
                }
                else {
                    console.log("ListView - CurrentIndexChanged! - Before Current: "+currentIndex)

                    if(username.changedText) {
                        username.changedText = false
                        currentIndex = 0
                    }
                    console.log("ListView - CurrentIndexChanged! - After Current: "+currentIndex)
                }
                if (indexIsNew) {
                    console.log("ListView - CurrentIndexChanged! - Cambiato da TextInput")
                    indexIsNew = false
                }

            }
        }

        ScrollBar {
            id: scroll_listV_user

            orientation: Qt.Vertical
            height: listV_user.height;
            width: sbHeight
            scrollArea: listV_user;
        }

        Column {
            id: inputFields
            width: parent.width - listV_user.width - 2 * hMargin - sbHeight
            height: listV_user.height

            Rectangle {
                id: iconRectangle
                width:parent.width
                height: width / 2
                color: "transparent"

                Image {
                    id: qtIcon
                    width:iconRectangle.width
                    height: iconRectangle.height
                    source: localPath + "qt.gif"
                }
            }

            Rectangle {
                id: userNameLabel
                width: parent.width;
                height: listV_user.height/10
                color: "transparent"

                Text {
                    id: userNameText
                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    clip: true
                    font.bold: true
                    text: "Username"
                }
            }

            Rectangle {
                id: userNameInput
                width: parent.width - hMargin
                height: listV_user.height/10

                Text {
                    id: completion

                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter

                    color: "#c7c1c1"
                    clip: true
                }

                TextInput {
                    id: username

                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter

                    clip: true
                    property bool changedText: false

                    focus: true
                    KeyNavigation.tab: password

                    onTextChanged: {
                        if(!unameSelected) {

                            mySortModel.setFilterRegExp("^"+text)
                            changedText = true
                        }
                        else {
                            unameSelected = false
                        }

                        textUserValue = text

                    }

                    Keys.onPressed: {
                        changedText = false
                        if(event.key == Qt.Key_Tab) {
                            username.text=completion.text
                        }

                        if(event.key == Qt.Key_Right) {
                            if ((listV_user.currentIndex != -1) &&
                                    (((text != completion.text) && (text != "")) ||
                                     (text == "")
                                     )
                                    ) {
                                event.accepted = true;
                                text = completion.text
                            }
                        }
                        if(event.key == Qt.Key_Up) {
                            event.accepted = true;
                            listV_user.decrementCurrentIndex()
                        }
                        if(event.key == Qt.Key_Down) {
                            event.accepted = true;
                            listV_user.incrementCurrentIndex()
                        }
                    }
                }
            }

            Rectangle {
                id: passwordLabel
                width: parent.width - hMargin
                height: listV_user.height/10
                color: "transparent"

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter

                    clip: true

                    font.bold: true
                    text: textConstants.password
                }
            }
            PasswordBox {
                id: password
                width: parent.width - hMargin
                height: listV_user.height/10
                //font.pixelSize: 14

                KeyNavigation.backtab: username; KeyNavigation.tab: loginButton

                Keys.onPressed: {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        sddm.login(squareButton.textUserValue, password.text, session.index)
                        event.accepted = true
                    }
                }
            }
        }
    }

    Row {
        id: leftBar
        anchors.top: listRow.bottom
        anchors.topMargin: cbHeight / 4
        anchors.left: listRow.left

        spacing: 4

        Column {
            id: sessionCombo
            Text {
                id: lblSession
                text: textConstants.session
                wrapMode: TextEdit.WordWrap
                font.bold: true
                font.pixelSize: 12
            }

            ComboBox {
                id: session
                property string arroColor: "transparent"

                //font.pixelSize: 14
                model: sessionModel
                index: sessionModel.lastIndex
                width: 200
                height: controlBar.height
                color: "transparent"
                borderColor: "#ffd700"

                arrowIcon: "angle-down.png"
                KeyNavigation.backtab: password; KeyNavigation.tab: layoutBox
            }
        }

        Column {
            id: layoutCol

            Text {
                id: lblLayout
                text: textConstants.layout
                wrapMode: TextEdit.WordWrap
                font.bold: true
                font.pixelSize: 12
            }

            LayoutBox {
                id: layoutBox
                width: parent.width; height: 30
                font.pixelSize: 14
                color: "transparent"
                borderColor: "#ffd700"

                arrowIcon: "angle-down.png"

                KeyNavigation.backtab: session; KeyNavigation.tab: loginButton
            }
        }
    }

    Row { id: rightBar
        anchors.top: listRow.bottom
        anchors.topMargin: 39
        anchors.right: listRow.right
        anchors.rightMargin: 2 * (hMargin +sbHeight)
        spacing: 4
        // anchors.horizontalCenter: parent.horizontalCenter
        property int btnWidth: Math.max(loginButton.implicitWidth,
                                        shutdownButton.implicitWidth,
                                        rebootButton.implicitWidth, 80) + 8
        Button {
            id: loginButton
            text: textConstants.login
            width: parent.btnWidth

            onClicked: sddm.login(squareButton.textUserValue, password.text, session.index)

            KeyNavigation.backtab: username; KeyNavigation.tab: shutdownButton
        }

        Button {
            id: shutdownButton
            text: textConstants.shutdown
            width: parent.btnWidth

            onClicked: sddm.powerOff()

            KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
        }

        Button {
            id: rebootButton
            text: textConstants.reboot
            width: parent.btnWidth

            onClicked: sddm.reboot()

            KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: username
        }
    }
}
