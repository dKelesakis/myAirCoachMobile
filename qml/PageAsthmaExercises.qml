import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageAsthmaExercises
    title: qsTr("Asthma Exercises")

        property int sizeArrow: 20
        property int buttonWidth:  300
        property int buttonHeight:  400

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
                text: "Practise with a cat"
                onClicked: app.currentPage = "PageAsthmaExercisesCat.qml"

                }

            Button {
                id: button2
                width: buttonWidth
                text: "Practise with a circle"
                onClicked: app.currentPage = "PageAsthmaExercisesCircle.qml"
            }


            Button {
                id: button3
                width: buttonWidth
                text: "Practice with a Polygon"
                onClicked: app.currentPage = "PageAsthmaExercisesPolygon.qml"
            }


            Button {
                id: button4
                width: buttonWidth
                height: buttonHeight
                text: "Practise with a Star"
                onClicked: app.currentPage = "PageAsthmaExercisesStar.qml"
            }

  }

}



