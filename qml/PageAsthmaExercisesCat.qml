import QtQuick 2.4
import QtQuick.Controls 1.3


MyPage {
    id: pageAsthmaExercisesCat

    title: qsTr("Asthma Exercises")

    Keys.onReleased: {
        if (event.key === Qt.Key_Back) {
            app.currentPage = "PageAsthmaExercises.qml"
            event.accepted = true;
        }
    }

   Column {
        anchors.centerIn: parent
        spacing: 30*app.dp
        width: parent.width
        height: parent.height


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
      Slider {
          id: sensitivitySlider1
          anchors.topMargin: animation.top
          height: 180
          orientation: Qt.Horizontal

          minimumValue: 0.005
          maximumValue: 0.1
          stepSize: 0.0001
          value: 0.05
      }

  }
}
