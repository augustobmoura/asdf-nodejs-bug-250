#!/usr/bin/env bash

set -e

ASDF_VERSION="v0.8.1"
ASDF_INSTALL_DIR="${HOME}/.asdf"

if [[ ! -d ${ASDF_INSTALL_DIR} ]]; then
  git clone https://github.com/asdf-vm/asdf.git ${ASDF_INSTALL_DIR} --branch ${ASDF_VERSION}
fi

source $ASDF_INSTALL_DIR/asdf.sh

if ! asdf plugin-list | grep nodejs; then
  git clone https://github.com/augustobmoura/asdf-nodejs.git "$ASDF_INSTALL_DIR/plugins/nodejs"
  cd "$ASDF_INSTALL_DIR/plugins/nodejs/" 
  git checkout 95a2091f7b64497c002dc709b267f5d03f302498
  asdf reshim nodejs
fi

asdf reshim
