QT       += core gui
QT       += network
QT       += multimedia multimediawidgets
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    src/udp_subs/udp_subs.cpp \
    src/welcome_mdle/welcome_mdle.cpp

HEADERS += \
    mainwindow.h \
    src/MACRO.h \
    src/udp_subs/udp_subs.h \
    src/welcome_mdle/welcome_mdle.h

FORMS += \
    mainwindow.ui \
    src/udp_subs/udp_subs.ui \
    src/welcome_mdle/welcome_mdle.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES +=
