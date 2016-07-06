#include <QApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QDir>
#include <QtQml>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtGui>
//#include <QtQuick>

#include <QWindow>
#include <QQmlContext>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>
#include "myadmob.h"
#include "mydevice.h"
#include "qmlobjectstore.h"
#include "audiorecorder.h"
#include "qaudiolevel.h"
#include "audiosampler.h"
#include "waterfallitem.h"
#include "notificationclient.h"
#include "graph.h"
#include <QDebug>
#include "appmodel.h"
#include "fpstext.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("ITI");
    app.setOrganizationDomain("myaircoach.eu");
    app.setApplicationName("myAirCoach");

    //---------
    //QTranslator qtTranslator;
   // qtTranslator.load("myAirCoach_" + QLocale::system().name(), ":/");
    //app.installTranslator(&qtTranslator);
    //---------

    qmlRegisterType<MyAdmob>("myadmob", 1, 0, "MyAdmob");
    qmlRegisterType<MyDevice>("mydevice", 1, 0, "MyDevice");
    qmlRegisterType<QMLObjectStore>("QMLObjectStore", 1, 0, "QMLObjectStore");
    qmlRegisterType<WaterfallItem>("hu.timur", 1, 0, "Waterfall");

    qmlRegisterType<Graph>("Graph", 1, 0, "Graph");
    //QQmlApplicationEngine engine;

    qmlRegisterType<WeatherData>("WeatherInfo", 1, 0, "WeatherData");
    qmlRegisterType<AppModel>("WeatherInfo", 1, 0, "AppModel");
    qmlRegisterType<AudioRecorder>("AudioRecorder", 1, 0, "AudioRecorder");
    qmlRegisterType<FPSText>("FPSText", 1, 0, "FPSText");
//! [0]
    qRegisterMetaType<WeatherData>();


    //AudioRecorder recorder;

    QQmlApplicationEngine* engine = new QQmlApplicationEngine();
    //engine->rootContext()->setContextProperty("recorder", &recorder);
    engine->load(QUrl(QStringLiteral("qrc:/qml/main.qml")));  //main1




    QQmlContext * rootContext = engine->rootContext();
    /*const QStringList & musicPaths = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
    const QUrl musicUrl = QUrl::fromLocalFile(musicPaths.isEmpty() ? QDir::homePath() : musicPaths.first());
    rootContext->setContextProperty(QStringLiteral("musicUrl"), musicUrl);

    const QStringList arguments = QCoreApplication::arguments();
    const QUrl commandLineUrl = arguments.size() > 1 ? QUrl::fromLocalFile(arguments.at(1)) : QUrl();
    rootContext->setContextProperty(QStringLiteral("url"), commandLineUrl);
*/

   // NotificationClient *notificationClient;
  //  rootContext->setContextProperty(QLatin1String("notificationClient"),
   //                                                  notificationClient);


    //view.setResizeMode(QQuickView::SizeRootObjectToView);


    QObject * root = engine->rootObjects().first();














#ifdef Q_OS_ANDROID
    QString hash = QString("myAirCoach");
    QString dirStorageString = QString("/sdcard/Android/data/com.qtproject.qtangled/");
    QDir dir;
    if( dir.mkpath(dirStorageString) )
    {
        engine->setOfflineStoragePath( dirStorageString );
        engine->load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

        QString dbFileString = dirStorageString + hash + QString(".sqlite");
        QFile dbFile(dbFileString);
        if (dbFile.exists()) {
            QFile::setPermissions(dbFileString, QFile::WriteOwner | QFile::ReadOwner);
        }

        QFile iniFile( dir.path() + hash + QString(".ini") );
        iniFile.open( QIODevice::WriteOnly );
        iniFile.write( "[General]\nDescription=Catalog\nDriver=QSQLITE\nName=Catalog\nVersion=1.0" );
        iniFile.close();
    }
    else
    {
#endif
        //engine->load(QUrl(QStringLiteral("qrc:/qml/main.qml")));   //sos prosoxh velos h teleia
#ifdef Q_OS_ANDROID
    }
#endif


    return app.exec();
}

