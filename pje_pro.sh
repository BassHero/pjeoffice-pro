#!/bin/bash

pjeoffice_pro=pjeoffice-pro-v2.5.16u-linux_x64.zip

# Página de download do PJeOffice: https://pjeoffice.trf3.jus.br/pjeoffice-pro/docs/index.html

cd ~/Downloads

wget https://raw.githubusercontent.com/BassHero/pjeoffice-pro/main/icon/pjeoffice-pro.png && mv pjeoffice-pro.png ~/.local/share/icons
wget https://pje-office.pje.jus.br/pro/$pjeoffice_pro
unzip -o $pjeoffice_pro
rm $pjeoffice_pro

cd pjeoffice-pro && chmod a+x pjeoffice-pro.sh

cd ~

echo "#!/bin/bash
cd ~/Downloads/pjeoffice-pro
./pjeoffice-pro.sh
" >> pjeoffice-pro.sh
chmod a+x pjeoffice-pro.sh

cd ~/.local/share/applications

echo "[Desktop Entry]
Encoding=UTF-8
Name=PJeOffice
GenericName=PJeOffice
Exec=./pjeoffice-pro.sh
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
" >> pjeoffice-pro.desktop
chmod a+x pjeoffice-pro.desktop

cd ~
./pjeoffice-pro.sh

