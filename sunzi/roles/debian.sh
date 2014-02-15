# set linux
cp /etc/localtime /etc/localtime.org
cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

apt-get install -y tmux
apt-get install -y tree
apt-get install -y tig

aptitude install locales
dpkg-reconfigure locales

# dotfiles copy
cp /share/.bashrc /home/vagrant/.bashrc
cp /share/.vimrc /home/vagrant/.vimrc
cp /share/.tmux.conf /home/vagrant/.tmux.conf

chmod 755 -R /var/log/apache2
