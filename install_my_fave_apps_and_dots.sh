bash install_my_favourite_apps.sh
cd /tmp
git clone https://github.com/npquintos/dotfiles.git
cd /tmp/Linux-Installation
bash link_dot_files.sh
cd /tmp
git clone https://git.suckless.org/st
cd st
make clean install
cd /tmp

