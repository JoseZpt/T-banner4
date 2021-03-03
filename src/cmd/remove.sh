#!/bin/bash
source .../lib/colors.lib  #libreria de colores
source .../lib/fun.lib #funtiones

trap Adios INT

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
echo "
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
          /data/data/com.termux/files/usr/libexec/termux/command-not-found \"$1\"
  }
fi

PS1='\\$ ' "> $PREFIX/etc/bash.bashrc
fi

if [ -e ~/.termux/shell ]; then
rm ~/.termux/shell
fi
}
clear
Autor
eliminacion
clear
figlet -cf big listo
