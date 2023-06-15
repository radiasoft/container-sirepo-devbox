#!/bin/bash
build_image_base=${sirepo_devbox_base:-radiasoft/sirepo-ci}
build_is_public=1

build_as_root() {
    build_yum install openssh-server rscode-geant4
}
