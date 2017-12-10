import QtQuick 2.0

FocusScope {

//Rectangle {
    id: root

    property string textUserValue


    Text {
        id: text_under
        x: 60
        y: 140
        width: 100
        height: 20
        color: "#c7c1c1"
        clip: true
        text: qsTr("Digita il nome utente")
        font.pixelSize: 12
        objectName: "text_underT"
    }


    TextInput {
        id: textUser
        x: 60
        y: 140
        width: 100
        height: 20
        clip: true
        text: qsTr("")
        inputMask: qsTr("")
        passwordCharacter: "•"
        font.pixelSize: 12

        //        focus: parent.focus
        focus: true


        Keys.onPressed: {
            console.log("TextInput inside SquareButton!")
            if(event.key == Qt.Key_Right) {

                if((textUser.text != text_under.text) && (textUser.text != "")){
                       event.accepted = true;
                    textUser.text = text_under.text
                }



            }
            if(event.key == Qt.Key_Up) {
                event.accepted = true;
                listViewT1.decrementCurrentIndex()
            }
            if(event.key == Qt.Key_Down) {
                event.accepted = true;
                listViewT1.incrementCurrentIndex()
            }
            if((event.key == Qt.Key_Enter) || (event.key == Qt.Key_Enter)) {
                console.log("Enter o return");
                event.accepted = true;
            }
        }

        onTextChanged: {
            console.log("Text has changed to:", text)
            myAutoComp.postMessage(text)
            textUserValue = text
            if(textUser.text == text_under.text){
                listViewT1.visible = false
            }
            else {
                listViewT1.visible = true;

            }
        }
    }

    ListView {
        id: listViewT1
//        x: 245
//        y: 59
        width: 150; height: 100

        Component {
            id: contactsDelegateT
            Rectangle {
                id: wrapper
                width: 100
                height: contactInfo.height
                color: ListView.isCurrentItem ? "black" : "red"
                Text {
                    id: contactInfo
                    text: modelData
                    color: wrapper.ListView.isCurrentItem ? "red" : "black"
                }
            }
        }

        model: myModel
        delegate: contactsDelegateT
        onCurrentIndexChanged:  {
            console.log("Indice cambiato!")
            myAutoComp.postListIndex(currentIndex)

        }
    }
}
