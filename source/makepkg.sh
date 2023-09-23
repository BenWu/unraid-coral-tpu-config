#!/bin/bash
PLUGIN_NAME="coral-tpu-config"

DIR="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"
tmpdir=/tmp/tmp-${PLUGIN_NAME}-$(( $RANDOM * 123 + 123))
archive="$(dirname ${DIR})/archive"
version=$(date +"%Y.%m.%d")$1
archive_file="${archive}/${PLUGIN_NAME}-${version}.txz"

mkdir -p $tmpdir
cd $DIR
cp --parents -f $(find . -type f ! \( -iname "makepkg.sh" \) ) $tmpdir/
cd $tmpdir
chmod 0755 -R .
#makepkg -l y -c y ${archive}/${PLUGIN_NAME}-${version}.txz
tar -c --xz --owner root --group root -vf ${archive_file} .  # hack
md5sum ${archive_file} | awk '{print $1}' > "${archive_file}.md5"
rm -rf $tmpdir
