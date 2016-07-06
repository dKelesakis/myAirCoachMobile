import QtQuick 2.4
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import QtQuick.Controls 1.2

import mydevice 1.0


Rectangle {
id: menu
state: "MAIN_MENU_SHOWN"

Rectangle
{
    id: topLeftRect
    x: 100
    y: 100
    width: 100
    height: 100
    color: "red"
    radius: 6
    MouseArea { id: mousearea1; width: 100; height: 100; anchors.rightMargin: 0;anchors.fill: parent; onClicked: menu.state = "MAIN_MENU_HIDDEN"}
}

Rectangle
{
    id: topRightRect
    width: 100
    height: 100
    color: "blue"
    x: 350; y: 100
    radius: 6
    MouseArea {anchors.fill: parent; onClicked: menu.state = "MAIN_MENU_HIDDEN"}
}

Rectangle
{
    id: bottomLeftRect
    width: 100
    height: 100
    color: "green"
    x: 100; y: 250
    radius: 6
    MouseArea {anchors.fill: parent; onClicked: menu.state = "MAIN_MENU_HIDDEN"}
}

Rectangle
{
    id: bottomRightRect
    width: 100
    height: 100
    color: "yellow"
    x: 350; y: 250
    radius: 6
            MouseArea {
                id: mousearea2;
                anchors.fill: parent;
                onClicked:
                {
                menu.state = "MAIN_MENU_HIDDEN"
                mainmenu.GoToPanel();
                }
                }

                }

states: [
    State
    {
        name: "MAIN_MENU_HIDDEN"
        PropertyChanges {
            target: bottomRightRect
            x: 624
            y: 467
            opacity: 0
        }

        PropertyChanges {
            target: topRightRect
            x: 624
            y: -86
            opacity: 0
        }

        PropertyChanges {
            target: bottomLeftRect
            x: -85
            y: 467
            opacity: 0
        }

        PropertyChanges {
            target: topLeftRect
            x: -85
            y: -86
            opacity: 0
        }

        PropertyChanges
        {
            target: menu
            opacity: 0
        }

    },
    State {
        name: "MAIN_MENU_SHOWN"
    }
]

transitions:
[
    Transition {
    from: "MAIN_MENU_SHOWN"; to: "MAIN_MENU_HIDDEN"
        ParallelAnimation
        {
        NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad; duration: 1000 }
        NumberAnimation { property: "opacity"; duration: 1000 }
        }
    },

    Transition {
    from: "MAIN_MENU_HIDDEN"; to: "MAIN_MENU_SHOWN"
        ParallelAnimation
        {
        NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad; duration: 1000 }
        NumberAnimation { property: "opacity"; duration: 1000 }
        }
    }
]
}







/*ApplicationWindow {
    id: app

    property string appTitle: "myAirCoach"

    width: 360
    height: 640
    //width: 640
    //height: 360

    visible: true

    //property alias dp: device.dp
    //MyDevice { id: device }

    QtObject {
        id: palette
        //http://www.materialpalette.com/indigo/yellow
        property color darkPrimary: "#303F9F"
        property color primary: "#3F51B5"
        property color lightPrimary: "#C5CAE9"
        property color text: "#FFFFFF"
        property color accent: "#FFEB3B"
        property color primaryText: "#212121"
        property color secondaryText: "#727272"
        property color divider: "#B6B6B6"

        property color currentHighlightItem: "#dcdcdc"
    }


    property int orientationPortrait: 1
    property int orientationLandscape: 2
    property int orientation: 0
    onWidthChanged: {
        if( width > height ) {
            app.orientation = app.orientationLandscape
        } else {
            app.orientation = app.orientationPortrait
        }
    }

    Settings {
        id: settings
    }

    property string version: "2015100901"

    property alias currentPage: loader.source

    property int durationOfMenuAnimation: 500
    property int menuWidth: app.orientation == app.orientationLandscape ? 300*app.dp : app.width*0.85
    property int widthOfSeizure: 15*app.dp
    property bool menuIsShown: Math.abs(menuView.x) < (menuWidth*0.5) ? true : false
    property real menuProgressOpening


    Rectangle {
        id: normalView
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "white"

        *************************************************
        Rectangle {
            id: menuBar
            z: 5
            anchors.top: parent.top
            anchors.topMargin: 0
            width: parent.width
            height: app.orientation == app.orientationLandscape ? 40*app.dp : 50*app.dp
            color: palette.darkPrimary
            Rectangle {
                id: menuButton
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                width: 1.2*height
                height: parent.height
                scale: maMenuBar.pressed ? 1.2 : 1
                color: "transparent"
                MenuIconLive {
                    id: menuBackIcon
                    scale: (parent.height/height)*0.65
                    anchors.centerIn: parent
                    value: menuProgressOpening
                }
                MouseArea {
                    id: maMenuBar
                    anchors.fill: parent
                    onClicked: onMenu()
                }
                clip: true
            }
            Label {
                id: titleText
                anchors.left: menuButton.right
                anchors.verticalCenter: parent.verticalCenter
                text: appTitle
                font.pixelSize: 0.35*parent.height
                color: palette.text
            }
        }
        Image {
            id: imgShadow
            anchors.top: menuBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 6*app.dp
            z: 4
            source: "qrc:/images/shadow_title.png"
        }


       *************************************************
        Rectangle {
            id: menuView
            anchors.top: menuBar.bottom
            height: parent.height - menuBar.height
            width: menuWidth
            z: 3
            MainMenu {
                id: mainMenu
                anchors.fill: parent
                onMenuItemClicked: {
                    onMenu()
                    loader.source = page
                }
            }
            x: -menuWidth

            Behavior on x { NumberAnimation { duration: app.durationOfMenuAnimation; easing.type: Easing.OutQuad } }
            onXChanged: {
                menuProgressOpening = (1-Math.abs(menuView.x/menuWidth))
            }

            MouseArea {
                anchors.right: parent.right
                anchors.rightMargin: app.menuIsShown ? (menuWidth - app.width) : -widthOfSeizure
                anchors.top: parent.top
                width: app.menuIsShown ? (app.width - menuWidth) : widthOfSeizure
                height: parent.height
                drag {
                    target: menuView
                    axis: Drag.XAxis
                    minimumX: -menuView.width
                    maximumX: 0
                }
                onClicked: {
                    if(app.menuIsShown) app.onMenu()
                }
                onReleased: {
                    if( Math.abs(menuView.x) > 0.5*menuWidth ) {
                        menuView.x = -menuWidth //close the menu
                    } else {
                        menuView.x = 0 //fully opened
                    }
                }
            }
        }
        Image {
            id: imgShadowMenu
            anchors.top: menuBar.bottom
            anchors.bottom: menuView.bottom
            anchors.left: menuView.right
            width: 6*app.dp
            z: 5
            source: "qrc:/images/shadow_long.png"
            visible: menuView.x != -menuWidth
        }
        Rectangle {
            id: curtainMenu
            z: 1
            anchors.fill: parent
            color: "black"
            opacity: app.menuProgressOpening*0.5
        }



        Loader {
            id: loader
            anchors.top: menuBar.bottom;
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            //asynchronous: true
            onStatusChanged: {
                if( status == Loader.Loading ) {
                    curtainLoading.visible = true
                    titleText.text = appTitle
                } else if( status == Loader.Ready ) {
                    curtainLoading.visible = false
                } else if( status == Loader.Error ) {
                    curtainLoading.visible = false
                }
            }
            onLoaded: {
                titleText.text = item.title
            }
            Rectangle {
                id: curtainLoading
                anchors.fill: parent
                visible: false
                color: "white"
                opacity: 0.8
                BusyIndicator {
                    anchors.centerIn: parent
                }
            }
        }
    }

    function onMenu() {
        menuView.x = app.menuIsShown ? -menuWidth : 0
    }

    Component.onCompleted: {
        currentPage = "PageProfile.qml"
        mainMenu.currentItem = 0
    }
}
*/
