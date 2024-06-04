#!/bin/bash

echo "Por favor, insira sua senha"
sudo -v 

while true; do sudo -n true; sleep 60; kill -0 "$S" || exit; done 2>/dev/null &

echo "Atualizando o sistema"
sudo apt update && sudo apt upgrade -y

echo "Instalando pacotes padrão"
sudo apt install -y nala openjdk-21-jdk openjdk-17-jdk openjdk-8-jre neovim zsh fonts-cascadia-code timeshift ubuntu-restricted-extras curl git flatpak gnome-software gnome-software-plugin-flatpak tilix

echo "Instalando Google Chrome"
cd /tmp
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo nala update 
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg --configure -a
sudo nala install -f 
cd ~/

echo "Instalando flatpaks"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y org.gnome.World.PikaBackup;
flatpak install -y flathub io.github.shiftey.Desktop
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y com.heroicgameslauncher.hgl;
flatpak install -y io.dbeaver.DBeaverCommunity;
flatpak install -y rest.insomnia.Insomnia;
flatpak install -y flathub com.discordapp.Discord;
flatpak install -y flathub org.ppsspp.PPSSPP;
flatpak install -y flathub org.DolphinEmu.dolphin-emu;
flatpak install -y flathub org.duckstation.DuckStation;
flatpak install -y flathub com.usebottles.bottles;
flatpak install -y flathub com.github.Matoking.protontricks;
flatpak install -y flathub org.gimp.GIMP;
flatpak install -y flathub net.lutris.Lutris;
flatpak install -y flathub com.bitwarden.desktop;
flatpak install -y flathub io.github.mimbrero.WhatsAppDesktop;
flatpak install -y flathub org.mozilla.Thunderbird;
flatpak install -y flathub net.pcsx2.PCSX2;
flatpak install -y flathub org.gnome.Boxes;
flatpak install -y flathub io.github.giantpinkrobots.flatsweep
flatpak install -y flathub io.github.jeffshee.Hidamari
flatpak install -y flathub io.gitlab.idevecore.Pomodoro
flatpak install -y flathub org.gnome.design.Lorem

echo "Instalando snaps"
sudo nala update
sudo nala install snap -y

sudo snap install hello-world
sudo snap install code --classic 
sudo snap install docker
sudo snap install node --classic
sudo snap install ruby --classic
sudo snap install intellij-idea-community --classic
sudo snap install steam

echo "Limpando o sistema"
sudo nala autoremove -y
sudo nala clean

read -p "Deseja reiniciar o sistema agora? (s/n)" resposta

if ["$resposta" = "s"] || ["$resposta" = "S"]; then
  echo "Reiniciando o sistema..."
  sudo reboot
else
  echo "Pós-instalação concluída! Reinicie o sistema para utilizar novos recursos"
fi
