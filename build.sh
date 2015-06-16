#!/bin/bash

VERSION=0.1
FLAVOR=ruby
BUILDPATH=/imgbuild
OUTFILE=.$BUILDPATH/generated_main_installer.sh

function install() {
	echo "$BUILDPATH/$1" >> $OUTFILE
}

echo "#!/bin/bash" > $OUTFILE
echo "# (autogenerated by build.sh, edits will be lost)" >> $OUTFILE
chmod a+x $OUTFILE

install "install_my_init.sh"
install "install_nginx_passenger.sh"
install "install_rubyapp_utils.sh"

sudo docker build -t phusion/passenger_${FLAVOR}_redhat:${VERSION} .