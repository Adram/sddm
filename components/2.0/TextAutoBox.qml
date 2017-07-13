import QtQuick 2.0

FocusScope {
    id: root

    property string textUserValue
    property string textUserPassword
    property bool indice_cambiato: false
    property bool text_name_cambiato_da_text: false
    property int vMargin: 35
    property int hMargin: 30
    property int sbHeight: 8

    width: parent.width
    height: parent.height
    z:200

    Component {
        id: contactsDelegateT

        Rectangle {
            id: wrapper
            width: listV_user.height - 8
            height: listV_user.height/5
            property string prova_name: ListView.isCurrentItem ? contactInfo.text : "prova"
            property alias testo_input_cam: password_text.testo_input_cambiato
            property bool mouse_click
            color: (index % 2)? "white": "#f5f5f5"

            Text {
                id: contactInfo
                anchors {
                    left: parent.left; leftMargin: 2
                    right: parent.right; rightMargin: 2
                    top: parent.top; topMargin: 2
                }

                text: name
                font { pixelSize: 14; bold: true }

            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("MouseArea - indice: "+index)
                    listV_user.currentIndex = index
                    item.DelegateModel.inSelected = !item.DelegateModel.inSelected
                    password_text.focus = true
                    password_text.enabled = true
                    scope.focus = true
                    wrapper.mouse_click = true
                    text_name_cambiato_da_text = true
                    text_name.text = text_under.text
                }
            }

            focus: false
            onFocusChanged: {
                console.log("FocusScope - FocusChanged! - Current: "+listV_user.currentIndex+" Select: "+index)
            }

            onActiveFocusChanged: {
                console.log("FocusScope - ActiveFocusChaged!! - Current: "+listV_user.currentIndex+" Select: "+index)
            }

            TextInput {
                anchors.top: parent.top
                anchors.topMargin: 20
                width: 200
                id: password_text
                focus: true
                font { pixelSize: 14 }
                text: "listV_user password"
                color: wrapper.ListView.isCurrentItem ? "red" : "black"
                property bool testo_input_cambiato: false
                onTextChanged: {
                    textUserPassword = text
                }

                onFocusChanged: {
                    console.log("TextInput! - FocusChanged! - Current: "+listV_user.currentIndex+" Select: "+index)
                }

                onActiveFocusOnPressChanged: {
                    console.log("TextInput - ActiveFocusOnPressChanged! - Current: "+listV_user.currentIndex+" Select: "+index)
                }

                onActiveFocusChanged: {
                    console.log("TextInput - ActiveFocusChanged! - Current: "+listV_user.currentIndex+" Select: "+index)
                    console.log("TextInput - ActiveFocusChanged! - ActiveFocus: "+activeFocus)
                    if(activeFocus) {

                        indice_cambiato = true
                        listV_user.currentIndex = index
                        console.log("TextInput - ActiveFocusChanged! - After Index Changed ActiveFocus: "+activeFocus)
                        forceActiveFocus()
                        text_name_cambiato_da_text = true
                        text_name.text = text_under.text
                    }
                }

                Keys.onPressed: {
                    if((event.key == Qt.Key_Enter) || (event.key == Qt.Key_Return)) {
                        console.log("Dentro il ListView! - Premuto tasto Enter / Return")
                        // event.accepted = true;
                        // prova_password = text
                        // textUserPassword = text
                    }
                }
            }
            // }
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
            delegate: contactsDelegateT
            spacing: 0

            onCurrentItemChanged: {
                if (currentItem) {
                    text_under.text = currentItem.prova_name
                    currentItem.testo_input_cam = true
                    // errore currentItem.password_text.testo_input_cambiato = true
                }
            }
            onCurrentIndexChanged: {
                console.log("ListView - CurrentIndexChanged! - Current: "+currentIndex+" ActiveFocus: "+activeFocus)
                stato_indice_scroll = true
                stato_indice_scroll = false
                if (currentIndex == -1) {
                    text_under.text = ""
                    // text_under_index.text = ""
                }
                else {
                    console.log("ListView - CurrentIndexChanged! - Before Current: "+currentIndex)

                    if(text_name.changedText) {
                        text_name.changedText = false
                        currentIndex = 0
                    }
                    console.log("ListView - CurrentIndexChanged! - After Current: "+currentIndex)
                }
                if (indice_cambiato) {
                    console.log("ListView - CurrentIndexChanged! - Cambiato da TextInput")
                    indice_cambiato = false
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
            //color:"transparent"
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
                    source: applicationDirPath + "/../../../sddm/data/themes/maldives/qt.gif"
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
                    id: text_under

                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter

                    color: "#c7c1c1"
                    clip: true

                    //text: "inserisci il nome utente"
                }

                TextInput {
                    id: text_name

                    anchors.left: parent.left
                    anchors.leftMargin:sbHeight
                    anchors.verticalCenter: parent.verticalCenter

                    clip: true
                    property bool changedText: false


                    focus: true

                    onTextChanged: {
                        if(!text_name_cambiato_da_text) {

                            mySortModel.setFilterRegExp("^"+text)
                            changedText = true
                        }
                        else {
                            text_name_cambiato_da_text = false
                        }

                        textUserValue = text

                    }

                    Keys.onPressed: {
                        changedText = false
                        if(event.key == Qt.Key_Right) {
                            if ((listV_user.currentIndex != -1) &&
                                    (((text != text_under.text) && (text != "")) ||
                                     (text == "")
                                     )
                                    ) {
                                event.accepted = true;
                                text = text_under.text
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

                KeyNavigation.backtab: text_name; KeyNavigation.tab: loginButton

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

            KeyNavigation.backtab: text_name; KeyNavigation.tab: shutdownButton
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

            KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: text_name
        }
    }
}
