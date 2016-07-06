import QtQuick 2.4
import QtQuick.Controls 1.3
import WeatherInfo 1.0
import "components"  //afto to swzei

MyPage {
    id: pageWeather
    title: qsTr("Weather")



        Text {
            text: "Loading weather data..."
            anchors.centerIn: parent
            font.pointSize: 18
        }

//! [2]
}
//! [2]
