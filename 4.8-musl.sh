#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Musl .."

pushd "${CLFS}/sources"
tar zxf musl-1.1.16.tar.gz
pushd musl-1.1.16

./configure \
  CROSS_COMPILE=${CLFS_TARGET}- \
  --prefix=/ \
  --target=${CLFS_TARGET}
make
DESTDIR=${CLFS}/cross-tools/${CLFS_TARGET} make install

popd
popd

rm -rf "${CLFS}/sources/musl-1.1.16"
