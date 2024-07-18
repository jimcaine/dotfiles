#!/usr/bin/bash
yay -Sy zulu-17-bin
curl -O https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.sh
sh ./thinkorswim_installer.sh
rm thinkorswim_installer.sh
sed -i 's/\#\ INSTALL_4J_JAVA_HOME_OVERRIDE=/INSTALL_4J_JAVA_HOME_OVERRIDE=\/usr\/lib\/jvm\/zulu-17/' ~/.thinkorswim/thinkorswim
