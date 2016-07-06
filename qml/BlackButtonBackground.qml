import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    property bool pressed: false

    gradient: Gradient {
        GradientStop {
            color: pressed ? "#222" : "#333"
            position: 0
        }
        GradientStop {
            color: "#222"
            position: 1
        }
    }
    Rectangle {
        height: 1
        width: parent.width
        anchors.top: parent.top
        color: "#444"
        visible: !pressed
    }
    Rectangle {
        height: 1
        width: parent.width
        anchors.bottom: parent.bottom
        color: "#000"
    }
}
