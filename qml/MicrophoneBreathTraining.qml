import QtQuick 2.4
import QtQuick.Controls 1.3


MyPage {
    id: pageMicrophoneBreathTraining

    title: qsTr("Microphone Breath Training")


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
                    source: "../images/lungstraining.jpg"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    recorder.record();
                    console.log("Recording...");
                }
            }
        }

    }
    Rectangle {
        width: animation.width; height: animation.height + 8

        AnimatedImage { id: animation; source: "qrc:/images/gifcat.gif" }

        Rectangle {
            property int frames: animation.frameCount

            width: 4; height: 8
            x: (animation.width - width) * animation.currentFrame / frames
            y: animation.height
            color: "red"
        }
    }



}
