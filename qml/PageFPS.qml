import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.0
import QtMultimedia 5.0
import FPSText 1.0
//import QtWinExtras 1.0 as Win

MyPage {
    id: pageFPS

    title: qsTr("FPS")


    FPSText{
            id: fps_text
            x:0
            y: 0;
            width: 200
            height: 100
            Text {
                    anchors.centerIn: parent
                    text: fps_text.fps.toFixed(2)
                }
        }
}

