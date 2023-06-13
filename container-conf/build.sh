#!/bin/bash
build_image_base=${sirepo_devbox_base:-radiasoft/sirepo-ci}
build_is_public=1

build_as_root() {
    umask 022
    build_yum install rscode-geant4
}
