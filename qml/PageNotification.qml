import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import notificationclient 1.0

MyPage {
    id: pageNotification
    title: qsTr("Notification Page")

    Column {
        anchors.fill: parent
        spacing: (height - happyButton.height - sadButton.height - title.height) / 3

        Text {
            id: title
            color: "black"
            font.pixelSize: parent.width / 20
            text: "How are you feeling?"
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }

        Image {
            id: happyButton
            height: parent.height / 5
            fillMode: Image.PreserveAspectFit
            source: "../images/happy.png"
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true

            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: notificationClient.notification = "User is happy!"
                onPressed: happyButton.scale = 0.9
                onReleased: happyButton.scale = 1.0
            }
        }

        Image {
            id: sadButton
            height: parent.height / 5
            fillMode: Image.PreserveAspectFit
            source: "../images/sad.png"
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true

            Behavior on scale {
                PropertyAnimation {
                    duration: 100
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: notificationClient.notification = "User is sad :("
                onPressed: sadButton.scale = 0.9
                onReleased: sadButton.scale = 1.0
            }
        }
    }

}


