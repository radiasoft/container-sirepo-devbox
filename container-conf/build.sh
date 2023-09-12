#!/bin/bash
build_is_public=1
build_image_base=${sirepo_devbox_base:-radiasoft/beamsim-jupyter}

build_as_root() {
    install_repo_eval container-sirepo-base root
    build_yum install rscode-geant4
    # QT5 expects kernel >= 3.15. Centos7 supports 3.10. This removes
    # the kernel check when loading the lib. This could result in
    # errors when using QT but so far we haven't experienced any.
    strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so
}

build_as_run_user() {
    install_repo_eval container-sirepo-base run_user
}
