TEMPLATE = app

QT += qml quick widgets multimedia sql  core gui core network positioning #androidextras  #kinhto h laptop


#android: {
#QT += androidextras
#}

deployment.files += sounds/access_denied.mp3
deployment.files += sounds/button.mp3
deployment.files += sounds/drag_point_press.mp3
deployment.files += sounds/drag_point_release.mp3
deployment.files += sounds/level_completed.mp3
deployment.files += sounds/menu_music_01.mp3
deployment.files += sounds/game_music_01.mp3
deployment.files += sounds/game_music_02.mp3
deployment.files += sounds/game_music_03.mp3
deployment.path = /assets/sounds
INSTALLS += deployment

TRANSLATIONS = qtangled_ru.ts
OTHER_FILES += qtangled_ru.qm \
               icons/*


HEADERS += sources/myadmob.h \
    sources/mydevice.h \
    sources/qmlobjectstore.h \
    sources/audiorecorder.h \
    sources/qaudiolevel.h \
    sources/audiosampler.h \
    sources/waterfallitem.h \
    sources/dft/dft.h \
    sources/dft/radix2fft.h \
    sources/notificationclient.h \
    sources/graph.h \
    sources/gridnode.h \
    sources/linenode.h \
    sources/noisynode.h \
    sources/appmodel.h \
    sources/fpstext.h

SOURCES += sources/main.cpp \
    sources/myadmob.cpp \
    sources/mydevice.cpp \
    sources/qmlobjectstore.cpp \
    sources/audiorecorder.cpp \
    sources/qaudiolevel.cpp \
    sources/audiosampler.cpp \
    sources/waterfallitem.cpp \
    sources/dft/dft.cpp \
    sources/dft/radix2fft.cpp \
    sources/notificationclient.cpp \
    sources/graph.cpp \
    sources/gridnode.cpp \
    sources/linenode.cpp \
    sources/noisynode.cpp \
    sources/appmodel.cpp \
    sources/fpstext.cpp

RESOURCES += qml.qrc \
    images.qrc \
    levels.qrc \
    i18n.qrc

evilhack {
SOURCES +=  \
    qml/GameStorage.qml \
    qml/MyLine.qml \
    qml/PageInvLinesGame.qml \
    qml/PageSettings.qml \
    qml/DialogEndGame3.qml \
    qml/MainMenu.qml \
    qml/MyPage.qml \
    qml/PageLimitedMovementsGameLevels.qml \
    qml/PageSimpleGameLevels.qml \
    qml/main.qml \
    qml/PageAbout.qml \
    qml/PageLimitedMovementsGame.qml \
    qml/PageSimpleGame.qml \
    qml/DragPoint.qml \
    qml/MenuIconLive.qml \
    qml/PageInvLinesGameLevels.qml \
    qml/VisualTimer.qml




# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)


DISTFILES += \
    android/AndroidManifest.xml \
    android/project.properties \
    android/src/org/qtproject/example/admobqt/AdMobQtActivity.java \
    android/res/values/libs.xml \
    android/build.gradle \
    android/src/org/qtproject/example/notification/NotificationClient.java \



ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

DISTFILES += \
    shaders/line.fsh \
    shaders/noisy.fsh \
    shaders/line.vsh \
    shaders/noisy.vsh

