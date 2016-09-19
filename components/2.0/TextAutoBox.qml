import QtQuick 2.0

FocusScope {
    id: root
    property string textUserValue
    property string textItem


    ListView {
        id: listV_user
        //anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        width: 200; height: 100

        Component {
            id: contactsDelegateT

            Rectangle {
                id: wrapper
                width: 200
                height: contactInfo.height
                color: ListView.isCurrentItem ? "black" : "red"
                property string prova_name: ListView.isCurrentItem ? contactInfo.text : ""
                Text {
                    id: contactInfo
                    text: model.name

                    color: wrapper.ListView.isCurrentItem ? "red" : "black"
                }
            }
        }

        model: mySortModel
        //delegate: Text { text: name}
        delegate: contactsDelegateT


        onCurrentItemChanged: {
            if (currentItem) {
                text_under.text = currentItem.prova_name
            }
        }
        onCurrentIndexChanged: {
            console.log("Indice cambiato!")
            if (currentIndex == -1) {
                console.log("Indice a -1")
                text_under.text = ""
                // text_under_index.text = ""
            }
            else {
                console.log("Indice a " + currentIndex.toString())
                if(text_name.testo_cambiato) {
                    text_name.testo_cambiato = false
                    currentIndex = 0
                }
            }
        }
    }


    Text {
        id: text_under

        y: 140
        width: 200
        height: 20
        color: "#c7c1c1"
        clip: true

        text: "inserisci il nome utente"
    }

    TextInput {
        id: text_name

        y: 140
        width: 200
        height: 20
        clip: true
        //text: qsTr("Sono qui!!")
        //inputMask: qsTr("")
        //passwordCharacter: "•"
        //font.pixelSize: 12

        property bool testo_cambiato: false


        focus: true

        onTesto_cambiatoChanged: {
            console.log("testo_cambiato è stato cambiato! Indice: " + listV_user.currentIndex.toString())

        }

        onTextChanged: {
            console.log("Testo cambiato!")
            //myModel.setFilterRegExp("^"+text)
            mySortModel.setFilterRegExp("^"+text)
            //listV_user.visible = true
            //listV_animal.visible = true
            textUserValue = text

            testo_cambiato = true

            if(text == "") {
                if(listV_user.currentItem)
                {
                    console.log("Testo cambiato - indice a: " + listV_user.currentIndex.toString())
                    console.log("Testo cambiato - a nullo!")
                    //listV_user.currentIndex = 0
                }
            }
            else {
                if(listV_user.currentItem)
                {
                    console.log("Testo cambiato - indice a: " + listV_user.currentIndex.toString())
                    console.log("Testo cambiato - a: " + text)
                    //listV_user.currentIndex = 0
                }
            }
        }

        Keys.onPressed: {
            console.log("Tasto premuto")
            testo_cambiato = false
            if(event.key == Qt.Key_Right) {
                console.log("Tasto destro")

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
                console.log("Tasto su")
                event.accepted = true;
                listV_user.decrementCurrentIndex()
            }
            if(event.key == Qt.Key_Down) {
                console.log("Tasto giù")
                event.accepted = true;
                listV_user.incrementCurrentIndex()
            }
            if((event.key == Qt.Key_Enter) || (event.key == Qt.Key_Return)) {
                console.log("Tasto Enter / Return")
                // event.accepted = true;
            }
        }
    }
}
