import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageSocial
    title: qsTr("Social")

    property int sizeArrow: 20
    property int buttonWidth:  200

    Loader {
        id: loader
        anchors.fill: parent
        visible: source != ""
    }

    Column {
        id: ourColumn
        Button {
            id: button1
            width: buttonWidth
            text: "About Asthma"
            onClicked: app.currentPage = "PageAbout.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Treatment"
            onClicked: app.currentPage = "PageAbout.qml"
        }


        Button {
            id: button3
            width: buttonWidth
            text: "Taking Control"
            onClicked: app.currentPage = "PageAbout.qml"
        }


        Button {
            id: button4
            width: buttonWidth
            text: "Lifestyle"
            onClicked: app.currentPage = "PageAbout.qml"
        }


        Button {
            id: button5
            width: buttonWidth
            text: "Resources & Support"
            onClicked: app.currentPage = "PageAbout.qml"
        }

    }

 }




