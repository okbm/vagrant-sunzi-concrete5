VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "vagrant-debian"
    config.vm.box_url = "http://ergonlogic.com/files/boxes/debian-LAMP-current.box"

    config.ssh.forward_agent = true

    config.vm.network :private_network, ip: "192.168.56.101"
    config.vm.network :forwarded_port, guest: 80, host: 8888, auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 8889, auto_correct: true

    config.vm.synced_folder ".", "/share", \
          create: true, owner: 'vagrant', group: 'vagrant', \
          mount_options: ['dmode=777,fmode=666']

    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", "512"]
    end

    config.vm.provision :shell, :inline => <<-EOT
        echo 'root:vagrant' | /usr/sbin/chpasswd
    EOT
end
