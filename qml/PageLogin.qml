import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1


MyPage {
    id: pageLogin
    title: qsTr("Account Login")


    LoginStack {
        width: 500
        height: 40
        anchors.centerIn: parent
    }


}


