TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/ \
    $${TOP_SRCDIR}/src/lib/logic/
    $${TOP_SRCDIR}/plugins/westernsupport

HEADERS         = \
    portugueseplugin.h

TARGET          = $$qtLibraryTarget(portugueseplugin)

EXAMPLE_FILES = portugueseplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${UBUNTU_KEYBOARD_LIB_DIR}/pt/

lang_db_pt.path = $$PLUGIN_INSTALL_PATH
lang_db_pt.files += $$OUT_PWD/database_pt.db
lang_db_pt.commands += \
  rm -f $$lang_db_pt.files && \
  text2ngram -n 1 -l -f sqlite -o $$lang_db_pt.files $$PWD/historias_sem_data.txt && \
  text2ngram -n 2 -l -f sqlite -o $$lang_db_pt.files $$PWD/historias_sem_data.txt && \
  text2ngram -n 3 -l -f sqlite -o $$lang_db_pt.files $$PWD/historias_sem_data.txt && \
  cp $$lang_db_pt.files \"$(INSTALL_ROOT)\"$$PLUGIN_INSTALL_PATH

QMAKE_EXTRA_TARGETS += lang_db_pt

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_pt

OTHER_FILES += \
    portugueseplugin.json \
    historias_sem_data.txt

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage

enable-hunspell {
    # hunspell
    CONFIG += link_pkgconfig
    PKGCONFIG += hunspell
    DEFINES += HAVE_HUNSPELL
}

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
