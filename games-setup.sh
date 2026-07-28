#!/bin/sh

cd
cd Downloads/
# Install drivers
sudo dpkg --add-architecture i386
sudo nala update && sudo nala upgrade -y
sudo nala install firmware-misc-nonfree -y

# Check if NVIDIA or AMD CPU
while [ "$cpu" != "amd" ] && [ "$cpu" != "intel" ] ; do
	read -p "\nWhich CPU are you using (amd/intel)? Please type amd or intel." cpu
done

if [ "$cpu" = "amd" ] ; then
	sudo nala install intel-microcode -y
elif [ "$cpu" = "intel" ] ; then
    sudo nala install amd64-microcode -y
    sudo update-initramfs -c -k all
    sudo nala update && sudo nala upgrade -y
fi

# Check if NVIDIA or AMD GPU
while [ "$gpu" != "amd" ] && [ "$gpu" != "nvidia" ] ; do
	read -p "\nWhich GPU are you using (amd/nvidia)? Please type amd or nvidia." gpu
done

if [ "$gpu" = "amd" ] ; then
	sudo nala purge *nvidia* -y
	sudo nala install linux-headers-amd64 -y	# x64 bit
	sudo nala install firmware-amd-graphics libgl1-mesa-dri libgl1-mesa-dri:i386 libglx-mesa0 libglx-mesa0:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386 xserver-xorg-video-all -y
elif [ "$gpu" = "nvidia" ] ; then
    sudo nala install nvidia-detect -y
    sudo nvidia-detect
    sudo nala update && sudo nala upgrade -y
	sudo nala install linux-headers-amd64 -y
	sudo nala install nvidia-kernel-dkms nvidia-driver nvidia-settings libvulkan-dev nvidia-vulkan-icd vulkan-tools  vulkan-validationlayers -y
	sudo nala install libnvidia-encode1 -y
	sudo nala install libnvidia-fbc1 -y
	sudo nala install nvidia-cuda-toolkit -y

fi

# Install Lutris
wget "https://cdn.fastly.steamstatic.com/client/installer/steam.deb" -O steam.deb
sudo nala install ./steam.deb -y
# Install Lutris
echo -e "Types: deb\nURIs: https://download.opensuse.org/repositories/home:/strycore:/lutris/Debian_13/\nSuites: ./\nComponents: \nSigned-By: /etc/apt/keyrings/lutris.gpg" | sudo tee /etc/apt/sources.list.d/lutris.sources > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore:/lutris/Debian_13/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/lutris.gpg
sudo nala update
sudo nala install lutris -y
# Install other dependencies
sudo nala install wine wine32 wine64 libwine libwine:i386 fonts-wine scummvm dosbox -y
sudo nala install gvfs:i386 wine32-preloader:i386 wine64-preloader wine-binfmt gstreamer1.0-libav:i386 gstreamer1.0-plugins-bad:i386 gstreamer1.0-plugins-ugly gstreamer1.0-tools:i386 opus-tools:i386 gstreamer1.0-alsa gamemode timidity gstreamer1.0-plugins-ugly:i386 -y
wget "http://ftp.de.debian.org/debian/pool/contrib/w/winetricks/winetricks_20250102-1_all.deb" -O winetricks.deb
sudo nala install ./winetricks.deb -y
sudo nala install fizmo-sdl2 libsdl2-2.0-0 libsdl2-dev libsdl2-gfx-1.0-0 libsdl2-gfx-dev libsdl2-image-2.0-0 libsdl2-mixer-2.0-0 libsdl2-net-2.0-0 -y
sudo nala install mingw-w64 flvmeta smpeg-plaympeg lame mjpegtools x265 x264 mpv mpg123 libxvidcore4 fluidsynth -y
sudo nala install mono-complete -y
# Install Java for XMage
sudo nala install default-jre default-jdk libopenjfx-jni -y
# Delete .deb files inside Downloads folder
cd ~/Downloads/
rm *deb