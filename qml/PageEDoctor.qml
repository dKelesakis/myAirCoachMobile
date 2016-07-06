import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageEDoctor
    title: qsTr("e-Doctor")

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
            text: "Single Breath Analysish"
            onClicked: app.currentPage = "PageSingleBreathAnalysis.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Weather Triggers Detection"
            onClicked: app.currentPage = "PageWeatherTriggersDetection.qml"
        }


        Button {
            id: button3
            width: buttonWidth
            text: "Medication Watch"
            onClicked: app.currentPage = "PageMedicationWatch.qml"
        }


    }

 }




