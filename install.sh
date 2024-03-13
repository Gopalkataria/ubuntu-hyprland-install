sudo apt install lirsvg2-dev libzip-dev libtomlplusplus-dev libgbm-dev

# source : debian sid repos 
sudo dpkg -i ./libdrm-dev_2.4.120-2_amd64

# source : debian trixie repos 
sudo dpkg -i ./wayland-protocols_1.33-1_all

git clone https://github.com/hyprwm/hyprlang.git
cd hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
cd .. 


git clone https://github.com/hyprwm/hyprcursor.git
cd hyprcursor
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd .. 

git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
# change cmaketxt with fixed one 
# fixed one comments line 246 
mv ../cmaketxt_fixed.txt ./CMakeLists.txt
sudo make all
sudo make install
