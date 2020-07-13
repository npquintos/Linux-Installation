bash ./install_my_favourite_apps.sh
cd /tmp
git clone https://github.com/npquintos/dotfiles.git
cd /tmp/Linux-Installation
bash ./link_dot_files.sh
cp /tmp/dotfiles/make_link_to_dotfiles.sh /usr/local/bin/.
chmod a+x /usr/local/bin/make_link_to_dotfiles.sh
