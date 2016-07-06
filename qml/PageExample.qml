import QtQuick 2.4
import QtQuick.Controls 1.3


MyPage {
    id: pageExample

    title: qsTr("Example")

    Column {
        anchors.centerIn: parent
        spacing: 30*app.dp
        width: parent.width

        Label {
            id: labelButtons
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Press any button")
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.9
            text: qsTr("Button 1")
            onClicked: labelButtons.text = qsTr("Button1 pressed")
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width*0.9
            text: qsTr("Button 2")
            onClicked: labelButtons.text = qsTr("Button2 pressed")
        }

        Button {
            id: button1
            width: parent.width/2 - 2
            iconSource: "qrc:/images/media-record.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    recorder.record();
                    console.log("Recording...");
                }
            }
        }

        Button {
            id: button2
            anchors.left: button1.right
            width: parent.width/2 - 2
            anchors.leftMargin: 4
            iconSource: "qrc:/images/media-playback-stop.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    recorder.stop();
                }
            }
        }
    }
}
