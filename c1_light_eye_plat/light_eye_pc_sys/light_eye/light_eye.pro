QT       += core gui
QT       += network multimedia multimediawidgets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    src/camera/camera.cpp \
    src/udp/udp_client.cpp \
    src/udp/udp_ctrl.cpp \
    src/udp/udp_server.cpp

HEADERS += \
    mainwindow.h \
    src/camera/camera.h \
    src/udp/udp_client.h \
    src/udp/udp_ctrl.h \
    src/udp/udp_macro.h \
    src/udp/udp_server.h

FORMS += \
    mainwindow.ui \
    src/camera/camera.ui \
    src/udp/udp_client.ui \
    src/udp/udp_ctrl.ui \
    src/udp/udp_server.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
