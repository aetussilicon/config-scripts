#!/bin/bash

echo "Por favor, insira sua senha"
sudo -v 

while true; do sudo -n true; sleep 60; kill -0 "$S" || exit; done 2>/dev/null &

echo "Atualizando o sistema"
sudo pacman -Syyu

echo "Instalando yay"
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "Instalando pacotes base"
yay -Sy neovim zsh git curl wget jdk21-openjdk jdk17-openjdk jre8-openjdk flatpak google-chrom-stable visual-studio-code-bin ttf-ms-fonts libreoffice-still-pt-br thunderbird allacrity ttf-cascadia-code nerd-fonts snapd firefox

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

sudo snap install hello-world
sudo snap install code --classic 
sudo snap install docker
sudo snap install node --classic
sudo snap install ruby --classic
sudo snap install intellij-idea-community --classic
sudo snap install steam

echo "Pull do repositório de config"
git clone https://github.com/aetussilicon/config-scripts.git .scripts
cd .scripts/config-files
cp -r i3 /home/$USER/.config
cp -r lvim /home/$USER/.config
cp -r polybar /home/$USER/.config
cp -r rofi /home/$USER/.config

read -p "Deseja reiniciar o sistema agora? (s/n)" resposta

if ["$resposta" = "s"] || ["$resposta" = "S"]; then
  echo "Reiniciando o sistema..."
  sudo reboot
else
  echo "Pós-instalação concluída! Reinicie o sistema para utilizar novos recursos"
fi
