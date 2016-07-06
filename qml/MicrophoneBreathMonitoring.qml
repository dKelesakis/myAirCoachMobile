import QtQuick 2.4
import QtQuick.Controls 1.3


MyPage {
    id: pageMicrophoneBreathMonitoring

    title: qsTr("Microphone Breath Monitoring")



    Row {
        anchors.centerIn: parent
        spacing: 30*app.dp
        width: parent.width
        height: parent.height

        Button {
            id: button1
            width: parent.width/2
            height: parent.height/5
            Image {
                    anchors.fill: parent
                    source: "../images/Play1Normal.ico"
            }
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
            width: parent.width/2
            height: parent.height/5
            anchors.leftMargin: 4
            Image {
                    anchors.fill: parent
                    source: "../images/Stop1NormalBlue.ico"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    recorder.stop();
                }
            }
        }

        Button {
            id: button3
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
            id: button4
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
