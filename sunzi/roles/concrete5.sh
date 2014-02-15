# concrete5 uniq setup
# apacheの設定
#cp /share/apache/concrete5 /etc/apache2/sites-available/
#ln -s /etc/apache2/sites-available/concrete5 /etc/apache2/sites-enabled/concrete5

# concrete5 source checkout
git clone https://github.com/concrete5japan/concrete5.git /home/vagrant/concrete5/
chmod 777 /home/vagrant/concrete5/web/config/
chmod 777 /home/vagrant/concrete5/web/files/
chmod 777 /home/vagrant/concrete5/web/packages/
chown vagrant -R /home/vagrant/concrete5/

# MySQL init setup
echo 'CREATE DATABASE concrete5 DEFAULT CHARACTER SET utf8;' > tmp
mysql -uroot < tmp
rm tmp
