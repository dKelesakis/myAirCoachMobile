import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pagePersonalProfile
    title: qsTr("Personal Profile")
    clip: true

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
            text: "Login"
            onClicked: app.currentPage = "PageLogin.qml"

            }

        Button {
            id: button2
            width: buttonWidth
            text: "Register"
            onClicked: app.currentPage = "PageRegister.qml"
        }

    }

 }




