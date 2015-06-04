# -*- mode: ruby -*-
# vi: set ft=ruby :
 
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-14.04-64"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :apt
    config.cache.enable :gem
  end


  config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--cpus", 1]
  end

  nodes = {
        :master1 => {
            :name => :master1,
            :ip => '10.10.20.11',
            :box => :master1
        },

        :master2 => {
            :name => :master2,
            :ip => '10.10.20.12',
            :box => :master2
        },

        :master3 => {
            :name => :master3,
            :ip => '10.10.20.13',
            :box => :master3
        },

        :slave1 => {
            :name => 'slave1',
            :ip => '10.10.20.50',
            :box => :slave1
        },

        :slave2 => {
            :name => 'slave2',
            :ip => '10.10.20.51',
            :box => :slave2
        },

        :slave3 => {
            :name => 'slave3',
            :ip => '10.10.20.52',
            :box => :slave3
        }
  }

  nodes.each do |node, details| 
    nodename = details[:name]
    config.vm.define nodename do |config|
      config.vm.hostname = nodename.to_s
      config.vm.network :private_network, ip: details[:ip]
      config.vm.provision :hosts
      provision_filename = "provisioner.sh"
      config.vm.provision :shell, :path => provision_filename
    end
  end
end