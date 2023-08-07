#!/bin/bash
build_is_public=1
build_image_base=${sirepo_devbox_base:-radiasoft/beamsim-jupyter}

build_as_root() {
    install_repo_eval container-sirepo-base root
    build_yum install openssh-server rscode-geant4
    # QT5 expects kernel >= 3.15. Centos7 supports 3.10. This removes
    # the kernel check when loading the lib. This could result in
    # errors when using QT but so far we haven't experienced any.
    strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so
}

build_as_run_user() {
    install_repo_eval container-sirepo-base
    install_url radiasoft/sirepo
    #POSIT: This relies on the fact that individual package names don't have spaces or special chars
    npm install -g \
        $(install_download package.json | jq -r '.devDependencies | to_entries | map("\(.key)@\(.value)") | .[]')
}
