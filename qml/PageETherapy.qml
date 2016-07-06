import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageETherapy
    title: qsTr("e-Therapy")

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
            text: "Live Breath Monitoring"
            onClicked: app.currentPage = "PageLiveBreathMonitoring.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Asthma Exercises"
            onClicked: app.currentPage = "PageAsthmaExercises.qml"
        }


        Button {
            id: button3
            width: buttonWidth
            text: "Inhaler Therapy Session"
            onClicked: app.currentPage = "PageInhalerTherapySession.qml"
        }

    }

 }




