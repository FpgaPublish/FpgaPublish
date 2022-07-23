QT       += core gui
QT       += multimedia multimediawidgets
QT       += network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    src/camera_blck/camera_blck.cpp \
    src/camera_blck/camera_driv.cpp \
    src/udp_blck/udp_blck.cpp \
    src/udp_blck/udp_driv.cpp

HEADERS += \
    mainwindow.h \
    src/MACRO.h \
    src/camera_blck/camera_blck.h \
    src/camera_blck/camera_driv.h \
    src/udp_blck/udp_blck.h \
    src/udp_blck/udp_driv.h

FORMS += \
    mainwindow.ui \
    src/camera_blck/camera_blck.ui \
    src/camera_blck/camera_driv.ui \
    src/udp_blck/udp_blck.ui \
    src/udp_blck/udp_driv.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../version.md
