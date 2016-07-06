import QtQuick 2.4
import QtQuick.Controls 1.3
import AudioRecorder 1.0

MyPage {

    id: pageMicrophoneBreathRecording

    title: qsTr("Microphone Breath Recording")

    AudioRecorder {
        id: audioRecorder
    }

    Row {
        anchors.centerIn: parent
        spacing: 30*app.dp
        width: parent.width
        height: parent.height

        Label {
            id: labelButtons
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Press any button")
        }


        Button {
            id: button1
            width: parent.width/2
            height: parent.height/5
            Image {
                    anchors.fill: parent
                    source: "../images/MicrophoneNormal.ico"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    audioRecorder.record();                                 //recorder.record();
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
                    audioRecorder.stop();                                     //recorder.stop();
                }
            }
        }
    }

}
