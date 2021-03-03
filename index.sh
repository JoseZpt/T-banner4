#!/bin/bash

  PWDL=$PWD #Ruta actual
  declare -A ban #lista de archivos
#lib
  source src/lib/colors.lib  #libreria de colores
  source src/lib/fun.lib #funtiones
  #source $HOME/Downloads/0/git.sh/src/package/install.pkg #install package

#variable
  cd $PWDL
  chmod +xw src/certs/
  pass=$( base64 -d src/certs/.data.key ) #decodifica el archivo
  chmod -xw src/certs/

#Salida forzada
trap Adios INT

#Listado y seleccion del banner
banner() {
  clear
  setterm -foreground green;
  figlet -cf slant Banner;
  Autor
  echo -e "${color["Verde"]}Elige un  banner:\n";i=0;
  for ba in $(ls *); do
    ban[$((++i))]=$ba
    echo -e " ${color["Azul"]}[${color["Blanco1"]}$i${color["Azul"]}]${color["Blanco1"]} ${ban[$i]}"
  done
  echo -e " ${color["Azul"]}[${color["Blanco1"]}$(($i+1))${color["Azul"]}]${color["Blanco1"]} Add"
  printf " ${color["Azul"]}[${color["Blanco1"]}+${color["Azul"]}]${color["Verde"]} banner:${color["Blanco"]}"
  read banner
  case $banner in
    [1-9]|1[0-${i:1}]) # {1..19}
    #[1-9]|1[0-9]|2[0-${i:1}]
    #Si llega a 20 se usa la secuencia comentada
    #[1-9]|1[0-9]|2[0-9]|3[0-${i:1}]
    #si llega a 30 se sigue este paton y asi...
      banner=$(cat ${ban[$banner]})
      echo "${banner[@]}"
      echo
      read -p "Desea cambiarlo s/n? " n
      if [ $n != "n" ];then
        banner
      fi
      ;;
    $((i+1)))
      echo -e "${color["Verde"]} Presiona i para editar Pega el banner y cuando termines das 'ESC:x' "
      read -p "Nombre del banner: " Nombre
      nvim $Nombre
      banner=$(cat $Nombre)
      ;;
    *)
      echo -e " ${color["Rojo"]}[-]${color["Blanco1"]} Banner invalido..!${color["Blanco"]}"
      sleep 0.10
      banner
  esac
}

#Listado y sellecion del color
colors() {
  clear
  setterm -foreground green;
  figlet -cf slant Color;
  Autor
  echo -e "${color["Verde"]}Elige un color para el banner:\n";i=0;
  color_sort=($(for s in "${!color[@]}"; do echo $s; done | sort)) #ordena lospunteros del array
  for c in "${color_sort[@]}"; do
    echo -e "  ${color["Azul"]}[${color["Blanco1"]}$((++i))${color["Azul"]}]${color[$c]} $c ${color["FNegro"]}"
  done
  echo -e "  ${color["Azul"]}[${color["Blanco1"]}$(($i+1))${color["Azul"]}]${color[$c]} Add"
  printf "  ${color["Azul"]}[${color["Verde"]}+${color["Azul"]}]${color["Morado"]} Color:${color["Blanco1"]} "
  read colors
  case $colors in
    [1-9]|1[0-9]|2[0-${i:1}])
      j=0;
      for l in ${color_sort[@]};do
          ((++j))
          if [ $colors = $j ];then
            colors=$l
            echo -e "\n ${color[$l]} "
            break
          fi
      done
      echo "${banner[@]}"
      echo
      echo -e ${color["FNegro"]}
      read -p "Desea cambiarlo s/n? " n
      if [ $n != "n" ];then
        colors
      fi
      ;;
    $(($i+1)))
      echo -e "${color["cyan1"]}  Presiona i para editar y cuando termines das 'ESC:x' "
      cd $PWDL/src/lib
      read
      nvim colors.lib
      ;;
    *)
      echo -e "  ${color["Rojo"]}[-]${color["Blanco1"]} = Color invalido..!${color["Blanco"]}"
      sleep 0.5
      colors
  esac
}

#veces que se repita
titilo() {
  clear
  setterm -foreground green;
  figlet -cf slant Veces;
  Autor
  echo -ne "${color["Verde"]} Defaul 4
  Cuantas veces quiere que titile: "
  read veces
}

# main
cd img;
banner
colors
titilo
clear

if [ -e $PREFIX/etc/motd ]; then
  rm $PREFIX/etc/motd
fi
cd ~/.Jin
if [ -f ~/.Jin/logo ];then
  echo
else
  sudo ln -s $PWDL/src/bin/Banner.bin logo
  chmod +x logo
  sudo cp logo $PREFIX/bin
  sudo cp logo $PREFIX/bin/applets
fi
if [ -f ~/.Jin/aliases ];then
  echo
else
  sudo ln -s $PWDL/src/bin/alias.sh aliases
  chmod +x aliases
  sudo cp aliases $PREFIX/bin
  sudo cp aliases $PREFIX/bin/applets
fi
cd $PWDL
sleep 0.5
#Rescribir el banner dependiendo del sistema
case "$OSTYPE" in
  linux-androideabi)
    if [ -e $PREFIX/etc/bash.bashrc ]; then
      echo "
      if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
          /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
      fi

      PS1='Jin$ '

      Banner.bin

      ">$PREFIX/etc/bash.bashrc
    fi
    ;;
  linux-gnu)
    #alias de linux
    echo "
    #User default
    . aliases
    logo
    ">~/.bash_aliases
    #echo "# Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    #if [ -f ~/.bash_aliases ]; then
    #  . ~/.bash_aliases
    #fi">>~/.bashrc
  ;;
esac

#logo
echo "#!/bin/bash
logo () {
  setterm -foreground red
  figlet -cf big JIN26
  sleep 0.1
  echo -e \"${color[$l]}\"
  printf '$banner'; sleep 0.5
  echo -e \"${color["FNegro"]}\"
  setterm -foreground green
  figlet -cf big $OSTYPE
  echo -e \"${color["Blanco"]}\"
}
veces=$veces
t=0
while [ \$t -le \$veces ]; do
    ((++t))
    clear
    logo
done">$PWDL/src/bin/Banner.bin
Autor
echo -ne "${color["Verde"]}Ver Banner(y/n):${color["Blanco"]} "
read yaa
if [ $n = "n" ];then
  . $PWDL/src/bin/Banner.bin
fi
exit
