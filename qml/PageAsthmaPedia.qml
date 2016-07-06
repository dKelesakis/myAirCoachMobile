import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageAsthmaPedia
    title: qsTr("Asthma-pedia")

    property int sizeArrow: 20
    property int buttonWidth:  200



    property bool isScreenPortrait: height > width
    property color lightFontColor: "#222"
    property color darkFontColor: "#e7e7e7"
    readonly property color lightBackgroundColor: "#cccccc"
    readonly property color darkBackgroundColor: "#161616"
    property real customizerPropertySpacing: 10
    property real colorPickerRowSpacing: 8


    Text {
        id: textSingleton
    }


    //new addition
    function toPixels(percentage) {
        return percentage * Math.min(root.width, root.height);
    }

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
            onClicked: app.currentPage = "PageAboutAsthma.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Treatment"
            onClicked: app.currentPage = "PageTreatment.qml"
        }


        Button {
            id: button3
            width: buttonWidth
            text: "Taking Control"
            onClicked: app.currentPage = "PageTakingControl.qml"
        }


        Button {
            id: button4
            width: buttonWidth
            text: "Lifestyle"
            onClicked: app.currentPage = "PageLifestyle.qml"
        }


        Button {
            id: button5
            width: buttonWidth
            text: "Resources & Support"
            onClicked: app.currentPage = "PageResources.qml"
        }

 }
}



