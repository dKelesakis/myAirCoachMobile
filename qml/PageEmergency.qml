import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageEmergency
    title: qsTr("Emergency")

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
            text: "Make a call"
            onClicked: app.currentPage = "PageEmergencyCall.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Send SMS"
            onClicked: app.currentPage = "PageEmergencySMS.qml"
        }


        Button {
            id: button3
            width: buttonWidth
            text: "Locate Inhaler"
            onClicked: app.currentPage = "PageNFCInhalerTracker.qml"
        }
    }

 }




