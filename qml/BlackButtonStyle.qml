import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

ButtonStyle {
    property color fontColor

    property url rightAlignedIconSource

    background: BlackButtonBackground {
        pressed: control.pressed
    }
    label: Item {
        implicitWidth: row.implicitWidth
        implicitHeight: row.implicitHeight
        baselineOffset: row.y + text.y + text.baselineOffset

        Row {
            id: row
            anchors.left: control.text.length === 0 ? undefined : parent.left
            anchors.leftMargin: control.text.length === 0 ? 0 : textSingleton.implicitHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: control.text.length === 0 ? parent.horizontalCenter : undefined

            Image {
                source: control.iconSource
                width: Math.min(sourceSize.width, height)
                height: text.implicitHeight
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: text
                text: control.text
                color: fontColor
                font.pixelSize: control.height * 0.25
                font.family: openSans.name
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Loader {
            active: rightAlignedIconSource.toString().length !== 0
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: textSingleton.implicitHeight

            sourceComponent: Image {
                width: Math.min(sourceSize.width, height)
                height: text.implicitHeight
                fillMode: Image.PreserveAspectFit
                source: rightAlignedIconSource
            }
        }
    }
}
