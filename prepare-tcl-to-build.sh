#!/bin/ash

#set -e

#
# Setting some environment variables
#
read -r <open-vm-tools.version TOOLS_VERSION
SFLINK="http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools/stable-9.10.x/open-vm-tools-${TOOLS_VERSION}.tar.gz/download"

echo "### Preparing this tiny core machine to build the open-vm-tools version $TOOLS_VERSION"

echo '### Pulling in the build dependencies from file build_dependencies'
while read line
do
  tce-load -iw $line
done < build-dependencies 

echo '### Preparing linux kernel compiling tools via /usr/local/bin/linux-kernel-sources-env.sh'
/usr/local/bin/linux-kernel-sources-env.sh

echo '### loading open-vm-tools tar file from sourceforge.net'
wget "${SFLINK}" -O "open-vm-tools-${TOOLS_VERSION}.tar.gz"

echo '### Done. The operating system is ready to build the tools.'
echo '### Continue with sudo ./build-and-install.sh'
