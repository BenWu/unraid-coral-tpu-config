#!/bin/bash
PLUGIN_NAME="coral-tpu-config"

DIR="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"
tmpdir=/tmp/tmp-${PLUGIN_NAME}-$(( $RANDOM * 123 + 123))
archive="$(dirname ${DIR})/archive"
version=$(date +"%Y.%m.%d")$1

mkdir -p $tmpdir
cd $DIR
cp --parents -f $(find . -type f ! \( -iname "makepkg.sh" \) ) $tmpdir/
cd $tmpdir
chmod 0755 -R .
#makepkg -l y -c y ${archive}/${PLUGIN_NAME}-${version}.txz
tar -c --xz --owner root --group root -vf ${archive}/${PLUGIN_NAME}-${version}.txz .  # hack
rm -rf $tmpdir
