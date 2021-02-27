#!/bin/bash

#lib
  source src/lib/* #libreria de colores

#variable
  pass=$(base64 -d src/certs/.data.key)#decodifica el archivo
  jk="ping -c 1 -q www.google.com >&/dev/null; echo $?" #Coneccion de internet
  pwdbanner=$PWD #Ruta actual

#Salida forzada
trap Adios INT

read

#chequeo de packete figlet,python2,setterm,nvim
case $(command -v figlet && command -v python2 && command -v setterm && command -v nvim) in
  "")
    case $jk in
      0)
        clear
        echo "${v}Instalando Dependencias..!$b\n"
        sudo apt install -y figlet
        #ls /usr/share/figlet
        #http://patorjk.com/software/taag/
        sudo apt install -Y setterm
        sudo apt-get install neovim;
        pkg install -y python2
        ;;
      *)
        -e "\n$r[-]$b1 banner:$r No Hay Conexion A Internet.\n$b"
        exit
    esac
esac

#Listado y seleccion del banner
banner() {
  clear
  setterm -foreground green;
  figlet -cf slant Banner;
  autor
  sleep 0.5
  echo -e "${v}Elige un  banner:"
  echo -e "\n
  for img in Hacker; do
    $A[${b1}01$A]${b1} Hacker
  done
  $A[${b1}02$A]${b1} Hacker2
  $A[${b1}03$A]${b1} Ruby
  $A[${b1}04$A]${b1} Bash
  $A[${b1}05$A]${b1} Craneo
  $A[${b1}06$A]${b1} Craneo2
  $A[${b1}07$A]${b1} Ghost
  $A[${b1}08$A]${b1} Scorpion
  $A[${b1}09$A]${b1} Cobra
  $A[${b1}10$A]${b1} Arma
  $A[${b1}11$A]${b1} Kali
  $A[${b1}12$A]${b1} Diablo
  $A[${b1}13$A]${b1} Pulpo
  $A[${b1}14$A]${b1} Calavera
  $A[${b1}15$A]${b1} Banner Personal"
  echo -e "  $A[$b1+$A]$v banner:$b"
  read banner
  case $banner in
    01|1)
      banner=$(cat $PWD/.Banners/hacker)
      ;;
    02|2)
      banner=$(cat $PWD/.Banners/hacker2)
      ;;
    03|3)
      banner=$(cat $PWD/.Banners/ruby)
      ;;
    04|4)
      banner=$(cat $PWD/.Banners/bash)
      ;;
    05|5)
      banner=$(cat $PWD/.Banners/craneo)
      ;;
    06|6)
      banner=$(cat $PWD/.Banners/craneo2)
      ;;
    07|7)
      banner=$(cat $PWD/.Banners/ghost)
      ;;
    08|8)
      banner=$(cat $PWD/.Banners/scorpion)
      ;;
    09|9)
      banner=$(cat $PWD/.Banners/cobra)
      ;;
    10)
      banner=$(cat $PWD/.Banners/arma)
      ;;
    11)
      banner=$(cat $PWD/.Banners/kali)
      ;;
    12)
      banner=$(cat $PWD/.Banners/diablo)
      ;;
    13)
      banner=$(cat $PWD/.Banners/pulpo)
      ;;
    14)
      banner=$(cat $PWD/.Banners/calavera)
      ;;
    15)
      echo -e "${v}Pega el banner y cuando termines das 'ESC:x' "
      read -p "Presiona Enter Para Continuar: "
      nvim .Banners/nuevo
      banner=$(cat $PWD/.Banners/nuevo)
      ;;
    *)
      echo -e " $r[-]$b1 Banner invalido..!$b"
      sleep 0.5
      banner
  esac
}

#Listado y sellecion del color
color() {
  clear
  setterm -foreground green;
  figlet -cf slant Banner;
  autor
  sleep 0.5
  echo -e "${v}Elige un color para el banner:"
  echo -e "
  $A[${b1}01$A]${b} Blanco
  $A[${b1}02$A]${b1} Blanco2
  $A[${b1}03$A]${r} Rojo
  $A[${b1}04$A]${r1} Rojo2
  $A[${b1}05$A]${A} Azul
  $A[${b1}06$A]${A1} Azul2
  $A[${b1}07$A]${ac} Azul3
  $A[${b1}08$A]${ac1} Azul4
  $A[${b1}09$A]${v} Verde
  $A[${b1}10$A]${v1} Verde2
  $A[${b1}11$A]${m} Morado
  $A[${b1}12$A]${m1} Morado2
  $A[${b1}13$A]${a} Amarillo
  $A[${b1}14$A]${a1} Amarillo2
  $A[${b1}15$A]${g} Gris"
  echo -e "  $A[$b1+$A]$v banner:$b "
  read color
  case $color in
    01|1)
      Color=$b
      ;;
    02|2)
      Color=$b1
      ;;
    03|3)
      Color=$r
      ;;
    04|4)
      Color=$r1
      ;;
    05|5)
      Color=$A
      ;;
    06|6)
      Color=$A1
      ;;
    07|7)
      Color=$ac
      ;;
    08|8)
      Color=$ac1
      ;;
    09|9)
      Color=$v
      ;;
    10)
      Color=$v1
      ;;
    11)
      Color=$m
      ;;
    12)
      Color=$m1
      ;;
    13)
      Color=$a
      ;;
    14)
      Color=$a1
      ;;
    15)
      Color=$g
      ;;
    *)
      echo -e " $r[-]$b1 Color invalido..!$b"
      sleep 0.5
      color
  esac
}

#veces que se repita
titilo() {
  clear
  setterm -foreground green;
  figlet -cf slant Banner;
  autor
  echo -ne "${v}Defaul 4
  Cuantas veces quiere que titile: "
  read veces
}

banner
color
titilo

if [ -e $PREFIX/etc/motd ]; then
rm $PREFIX/etc/motd
fi

#Rescribir el banner dependiendo del sistema
case "$OSTYPE" in
cygwin*)
;;
linux-androideabi)

if [ -e $PREFIX/etc/bash.bashrc ]; then
rm $PREFIX/etc/bash.bashrc
echo "
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
  command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
  }
fi

PS1='Jin$ '
setterm -foreground red
figlet -cf big \"JIN26\";
python2 $pwdbanner/Banner.py
setterm -foreground green
figlet -cf slant \"$OSTYPE\";
local=$(hostname -i)
figlet -cf big \"${local:0:11}:8080\" ||cowsay sorry
">$PREFIX/etc/bash.bashrc
fi
;;
linux-gnu)


#alias de linux
echo "#User default
alias vim='vim -p'

# some more ls aliases y tree
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -C'
alias treed='tree -dQ'
alias treel='tree -ph'

pwdjin='/data/data/com.termux/files/home/.Jin/kali/Kali-fs/root/Desktop/
setterm -foreground red
figlet -cf big \"JIN26\";
python2 $pwdbanner/Banner.py
setterm -foreground green
figlet -cf slant \"$OSTYPE\"
local=$(hostname -I)
figlet -cf slant \"${local:0:11}:8080\" ||cowsay sorry

case '$OSTYPE' in
    cygwin*)
        alias open="cmd /c start"
        ;;
    linux-androideabi)
        alias start="xdg-open"
        alias open="xdg-open"
        ;;
    linux-gnu)
        alias start="xdg-open"
        alias open="xdg-open"
        ;;
    darwin*)
        alias start="open"
        ;;
esac">~/.bash_aliases
# "# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#. ~/.bash_aliases
#fi">>~/.bashrc
;;
darwin*)
;;
esac

echo "#!/bin/python2
#coding=utf-8
import os,sys,time
def maung(n):
  for m in n + '\n':
    sys.stdout.write(m)
    sys.stdout.flush()
    time.sleep(0.001)
banner = \"\"\"">Banner.py
printf "$Color\n">>Banner.py
printf "$banner">>Banner.py
printf "$b\"\"\"\n">>Banner.py
echo "os.system(\"clear\")
maung(banner)" >> Banner.py
case $veces in
  "")
    veces=4
    i=1
    while [ $i -le $veces ]; do
      i=$(($i + 1))
      echo 'os.system("clear")' >> Banner.py
      echo "print (banner)" >> Banner.py
    done
    echo "print" >> Banner.py
    sleep 1
    ;;
  *)
    i=1
    while [ $i -le $veces ]; do
      i=$(($i + 1))
      echo 'os.system("clear")' >> Banner.py
      echo "print (banner)" >> Banner.py
    done
    echo "print" >> Banner.py
    sleep 1
esac
if [ -e .Banner ]; then
rm .Banner
fi
autor
echo -ne "${v}Ver Banner(y/n):$b "
read yaa
case $yaa in
  y|Y)
    python2 Banner.py
    ;;
  n|N)
    echo -e "$b"
    exit
    ;;
  *)
    echo -e "$b"
    exit
esac
exit

