#!/bin/bash
source ../lib/colors.lib
trap Adios INT
Adios() {
echo
sleep 0.3
printf "$v[$b1+$v]${b1} Finalizado\n"
printf "$v[$b1+$v]${b1} Anonymous Zpt$b\n "
echo
sleep 0.3
exit
}
eliminacion() {
if [ ! -e $PREFIX/etc/motd ]; then
cat > $PREFIX/etc/motd <<- EOM

Welcome to Termux!

Wiki:            https://wiki.termux.com
Community forum: https://termux.com/community
Gitter chat:     https://gitter.im/termux/termux
IRC channel:     #termux on freenode

Working with packages:

 * Search packages:   pkg search <query>
 * Install a package: pkg install <package>
 * Upgrade packages:  pkg upgrade

Subscribing to additional repositories:

 * Root:     pkg install root-repo
 * Unstable: pkg install unstable-repo
 * X11:      pkg install x11-repo

Report issues at https://termux.com/issues

EOM
fi
if [ -e $PREFIX/etc/bash.bashrc ]; then
rm $PREFIX/etc/bash.bashrc
echo "if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then" >> $PREFIX/etc/bash.bashrc
echo "  command_not_found_handle() {" >> $PREFIX/etc/bash.bashrc
echo '          /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"' >> $PREFIX/etc/bash.bashrc
echo "  }" >> $PREFIX/etc/bash.bashrc
echo "fi" >> $PREFIX/etc/bash.bashrc
echo >> $PREFIX/etc/bash.bashrc
echo "PS1='\\$ '" >> $PREFIX/etc/bash.bashrc
fi
if [ -e ~/.termux/shell ]; then
rm ~/.termux/shell
fi
}
clear
sleep 0.0
echo -e "\033[1;32m
______________.                                               _____
\__    ___/\_ |__  _____     ____    ____    ____  _______   /  |  |
  |    |    | __ \ \__  \   /    \  /    \ _/ __ \ \_  __ \ /   |  |_
  |    |    | \_\ \ / __ \_|   |  \|   |  \\   ___/  |  | \//    ^   /
  |____|    |___  /(____  /|___|  /|___|  / \___  > |__|   \____   |
                \/      \/      \/      \/      \/              |__|\n\033[0m"
printf "$A[$b1+$A]${b1} Creador:$a     Anonymous Zpt\n"
printf "$A[$b1+$A]${b1} Herramienta:$a T-banner4\n"
printf "$A[$b1+$A]${b1} GitHub:$a      https://github.com/Anonymous-Zpt\n"
printf "$A[$b1+$A]${b1} YouTube:$a     http://www.youtube.com/c/AnonymousZpt$b\n"
echo
sleep 3
eliminacion
clear
echo -e "\033[1;32m
______________.                                               _____
\__    ___/\_ |__  _____     ____    ____    ____  _______   /  |  |
  |    |    | __ \ \__  \   /    \  /    \ _/ __ \ \_  __ \ /   |  |_
  |    |    | \_\ \ / __ \_|   |  \|   |  \\   ___/  |  | \//    ^   /
  |____|    |___  /(____  /|___|  /|___|  / \___  > |__|   \____   |
                \/      \/      \/      \/      \/              |__|\n\033[0m"
echo
sleep 0.3
printf "$A[$b1+$A]${b1} Proceso:$a     Finalizado\n"
sleep 0.3
printf "$A[$b1+$A]${b1} Creador:$a     Anonymous Zpt\n"
sleep 0.3
printf "$A[$b1+$A]${b1} Herramienta:$a T-banner4\n"
sleep 0.3
printf "$A[$b1+$A]${b1} GitHub:$a      https://github.com/Anonymous-Zpt\n"
sleep 0.3
printf "$A[$b1+$A]${b1} YouTube:$a     http://www.youtube.com/c/AnonnymousZpt$b\n"
sleep 0.3
printf "$A[$b1+$A]${b1} Accion:$a      Banner Defaul$b\n"
echo
