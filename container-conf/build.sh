#!/bin/bash
build_image_base=${sirepo_devbox_base:-radiasoft/sirepo-ci}
build_is_public=1

build_as_root() {
    build_yum install openssh-server rscode-geant4
    # QT5 expects kernel >= 3.15. Centos7 supports 3.10. This removes
    # the kernel check when loading the lib. This could result in
    # errors when using QT but so far we haven't experienced any.
    strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so
}
