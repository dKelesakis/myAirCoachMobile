import QtQuick 2.4
import QtQuick.Controls 1.2


Item {
    id: menu

    signal menuItemClicked( string item, string page )
    property alias currentItem: listViewMenu.currentIndex

    ListModel {
        id: modelMenu

        ListElement {
            item: "personalprofile"
            icon: "qrc:/images/personalProfile.png"
            page: "PagePersonalProfile.qml"
        }
        ListElement {
            item: "edoctor"
            icon: "qrc:/images/eDoctor.png"
            page: "PageEDoctor.qml"
        }
        ListElement {
            item: "etherapy"
            icon: "qrc:/images/eTherapy.png"
            page: "PageETherapy.qml"
        }
        ListElement {
            item: "asthmapedia"
            icon: "qrc:/images/asthmaPedia.png"
            page: "PageAsthmaPedia.qml"
        }
        ListElement {
            item: "emergency"
            icon: "qrc:/images/emergency.png"
            page: "PageEmergency.qml"
        }
        ListElement {
            item: "social"
            icon: "qrc:/images/social.png"
            page: "PageSocial.qml"
        }
        ListElement {
            item: "settings"
            icon: "qrc:/images/settings.png"
            page: "PageSettings.qml"
        }
        ListElement {
            item: "help"
            icon: "qrc:/images/help.png"
            page: "PageHelp.qml"
        }
        ListElement {
            item: "aboutus"
            icon: "qrc:/images/about.png"
            page: "PageAboutUs.qml"
        }
        /*ListElement {
            item: "graph_page"
            icon: "qrc:/images/icon_info.png"
            page: "PageGraph.qml"
        }
        ListElement {
            item: "weather_page"
            icon: "qrc:/images/icon_info.png"
            page: "PageWeather.qml"
        }ListElement {
            item: "asthma_pedia"
            icon: "qrc:/images/icon_game.png"
            page: "PageSimpleGameLevels.qml"
        }
        ListElement {
            item: "login_screen"
            icon: "qrc:/images/icon_game.png"
            page: "PageLogin.qml"
        }
        ListElement {
            item: "notification_page"
            icon: "qrc:/images/icon_game.png"
            page: "PageNotification.qml"
        }
        ListElement {
            item: "invisible_lines"
            icon: "qrc:/images/icon_game.png"
            page: "PageInvLinesGameLevels.qml"
        }
        ListElement {
            item: "limited_mevements"
            icon: "qrc:/images/icon_game.png"
            page: "PageLimitedMovementsGameLevels.qml"
        }
        ListElement {
            item: "settings"
            icon: "qrc:/images/icon_settings.png"
            page: "PageSettings.qml"
        }
        ListElement {
            item: "about"
            icon: "qrc:/images/icon_info.png"
            page: "PageAbout.qml"
        }
        ListElement {
            item: "personalProfile"
            icon: "qrc:/images/icon_game.png"
            page: "PersonalProfile.qml"
        }
        ListElement {
            item: "personaleDoctor"
            icon: "qrc:/images/icon_game.png"
            page: "PersonaleDoctor.qml"
        }
        ListElement {
            item: "microphoneBreathRecording"
            icon: "qrc:/images/icon_settings.png"
            page: "MicrophoneBreathRecording.qml"
        }
        ListElement {
            item: "microphoneBreathMonitoring"
            icon: "qrc:/images/icon_settings.png"
            page: "MicrophoneBreathMonitoring.qml"
        }
        ListElement {
            item: "microphoneBreathTraining"
            icon: "qrc:/images/icon_settings.png"
            page: "MicrophoneBreathTraining.qml"
        }
        ListElement {
            item: "mediaPlayer"
            icon: "qrc:/images/icon_info.png"
            page: "PageMediaPlayer.qml"
        }


        ListElement {
            item: "fpsMeasurement"
            icon: "qrc:/images/icon_info.png"
            page: "PageFPS.qml"
        }
        ListElement {
            item: "sensorsBreathMonitoring"
            icon: "qrc:/images/icon_settings.png"
            page: "SensorsBreathMonitoring.qml"
        }*/

    }

    function textItemMenu( item )             //apo edw vgainoyn ta logia sto plagio menoy
    {
        var textReturn = ""
        switch( item ) {
        case "personalprofile":
            textReturn = qsTr("Personal Profile")
            break;
        case "edoctor":
            textReturn = qsTr("e-Doctor")
            break;
        case "etherapy":
            textReturn = qsTr("e-Therapy")
            break;
        case "asthmapedia":
            textReturn = qsTr("Asthma-pedia")
            break;
        case "emergency":
            textReturn = qsTr("Emergency")
            break;
        case "social":
            textReturn = qsTr("Social")
            break;
        case "settings":
            textReturn = qsTr("Settings")
            break;
        case "help":
            textReturn = qsTr("Help")
            break;
        case "aboutus":
            textReturn = qsTr("About us")
            break;
        /*case "graph_page":
            textReturn = qsTr("Graph")
            break;
        case "weather_page":
            textReturn = qsTr("Weather")
            break;case "asthma_pedia":
            textReturn = qsTr("Asthma-pedia")
            break;
        case "login_screen":
            textReturn = qsTr("Login")
            break;
        case "notification_page":
            textReturn = qsTr("Notification Page")
            break;
        case "invisible_lines":
            textReturn = qsTr("Invisible lines")
            break;
        case "limited_mevements":
            textReturn = qsTr("Limited movements")
            break;
        case "settings":
            textReturn = qsTr("Settings")
            break;
        case "about":
            textReturn = qsTr("About")
            break;
        case "personalProfile":
            textReturn = qsTr("Personal Profile")
            break;
        case "personaleDoctor":
            textReturn = qsTr("Personal eDoctor")
            break;
        case "microphoneBreathRecording":
            textReturn = qsTr("Breath Recording")
            break;
        case "microphoneBreathMonitoring":
            textReturn = qsTr("Breath Monitoring")
            break;
        case "microphoneBreathTraining":
            textReturn = qsTr("Breath Training")
            break;
        case "mediaPlayer":
            textReturn = qsTr("Media Player")
            break;
        case "fpsMeasurement":
            textReturn = qsTr("Measure FPS")
            break;
        case "help":
            textReturn = qsTr("Help")
            break;*/

        case "log":
            textReturn = "Log"
            break;
        }
        return textReturn

    }

    Rectangle {
        id: logoWtapper
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        width: parent.width
        height: width*0.5
        color: palette.primary
        clip: true
        Image {
            id: lollipop_bottom_middle
            source: "qrc:/images/lollipop_bottom_middle.png" //  lollipop_bottom_middle
            anchors.bottom: parent.bottom
            anchors.bottomMargin: (app._progressOpening-1)*(height/2)// - 7*app.dp
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -10*app.dp
            width: parent.width/3
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        Image {
            id: lollipop_top_right
            source: "qrc:/images/lollipop_top_right.png"  //lollipop_top_right
            anchors.top: parent.top
            anchors.topMargin: (app._progressOpening-1)*(height/2)// - 5*app.dp
            anchors.right: parent.right
            anchors.rightMargin: parent.width/17
            width: parent.width/3
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        Image {
            id: lollipop_top_left
            source: "qrc:/images/lollipop_top_left.png"   //lollipop_top_left
            anchors.top: parent.top
            anchors.topMargin: (app._progressOpening-1)*(height/2)// - 10*app.dp
            anchors.left: parent.left
            //anchors.leftMargin: parent.width/20
            width: parent.width/3
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        Image {
            id: imgLogoQTangled
            source: "qrc:/images/background.png"
            height: parent.height/4
            antialiasing: true
            smooth: true
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: -(app._progressOpening-1)*parent.width + 10*app.dp
            fillMode: Image.PreserveAspectFit
        }
    }
    Image {
        id: imgShadow
        anchors.top: logoWtapper.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 10*app.dp
        z: 4
        source: "qrc:/images/shadow_title.png"
    }
    ListView {
        id: listViewMenu
        anchors.top: logoWtapper.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        model: modelMenu
        delegate: componentDelegate
        anchors.leftMargin: (app._progressOpening-1)*60*app.dp
    }

    Component {
        id: componentDelegate

        Rectangle {
            id: wrapperItem
            height: 60*app.dp
            width: parent.width
            color: wrapperItem.ListView.isCurrentItem || ma.pressed ? palette.currentHighlightItem : "transparent"
            Image {
                id: imgItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0.5*imgItem.width
                height: parent.height*0.5
                width: height
                source: icon
                visible: icon != ""
                smooth: true
                antialiasing: true
            }

            Label {
                id: textItem
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: imgItem.right
                anchors.leftMargin: 0.7*imgItem.width
                text: textItemMenu( item )
                font.pixelSize: parent.height*0.3
                color: wrapperItem.ListView.isCurrentItem ? palette.darkPrimary : palette.primaryText
            }


            MouseArea {
                id: ma
                anchors.fill: parent
                enabled: app._menu_shown
                onClicked: {
                    menu.menuItemClicked( item, page )
                    listViewMenu.currentIndex = index
                }
            }
        }

    }
}



