#!/bin/bash

set -ex
shopt -s expand_aliases
export BUILD_DIR=${PWD}
set +u && source ${CMS_PATH}/cmsset_default.sh; set -u
ls -ltr
cd /home/cmsusr
export CMSSW_RELEASE=CMSSW_10_2_21
cmsrel ${CMSSW_RELEASE}
cd ${CMSSW_RELEASE}/src
mkdir -p NtuTool
mv ${BUILD_DIR}/Common NtuTool
mv ${BUILD_DIR}/EDM NtuTool
mv ${BUILD_DIR}/Read NtuTool
mv ${BUILD_DIR}/uty NtuTool
ls -ltr
cmsenv
scram b -v
