#!/bin/bash

echo "	############## PJe-Office Pro Linux Installer #############
	###########################################################
	
	Instalador do PJe-Office Pro no Ubuntu e derivados.
	
	Página de download do PJe-Office Pro: 
	https://pjeoffice.trf3.jus.br/pjeoffice-pro/docs/index.html
	
	Github desde Programa:
	https://github.com/BassHero/pjeoffice-pro
	
	Autor: Renato Ramalho
	email para contato: renatoramalho1986@gmail.com
"

# Variáveis

WEB_LINK_PJE=https://pje-office.pje.jus.br/pro
PJE_OFFICE_PRO=pjeoffice-pro-v2.5.16u-linux_x64.zip
WEB_LINK_ICON=https://raw.githubusercontent.com/BassHero/pjeoffice-pro/main/icon
PJE_ICON=pjeoffice-pro.png
ICONS_DIR=$HOME/.local/share/icons
APP_DIR=$HOME/.local/share/applications

# Baixando o programa e o icone

cd "$HOME/.local/share/"

#wget "$WEB_LINK_PJE/$PJE_OFFICE_PRO"
#unzip -o "$PJE_OFFICE_PRO"
#rm "$PJE_OFFICE_PRO"
cd pjeoffice-pro

wget "$WEB_LINK_ICON/$PJE_ICON"
mkdir -p "$ICONS_DIR"
mv "$PJE_ICON" "$ICONS_DIR"

# Executável da home

echo "#!/bin/bash
cd $HOME/.local/share/pjeoffice-pro
./pjeoffice-pro.sh
" > pjeoffice-pro-exec.sh

# Arquivo .desktop para aparecer na docker

echo "[Desktop Entry]
Encoding=UTF-8
Name=PJeOffice
GenericName=PJeOffice
Exec=./pjeoffice-pro-exec.sh
Icon=pjeoffice-pro
Type=Application
Terminal=false
X-GNOME-Autostart-enabled=true
X-KDE-autostart-after=panel
X-KDE-StartupNotify=false
X-DCOP-ServiceType=Unique
X-KDE-UniqueApplet=true
X-KDE-autostart-condition=AutoStart:true
Categories=Office;
Comment=pjeoffice-pro
" > pjeoffice-pro.desktop

#Permitindoaexecuão

chmod a+x pjeoffice-pro.sh
chmod a+x pjeoffice-pro-exec.sh
chmod a+x pjeoffice-pro.desktop

mv pjeoffice-pro-exec.sh $HOME
mv pjeoffice-pro.desktop $APP_DIR

#Executando

cd $HOME
./pjeoffice-pro-exec.sh
