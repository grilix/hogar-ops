# -*- type: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"
  config.vm.network "private_network", ip: "192.168.34.10"
  config.vm.disk :disk, size: "10GB", name: "osd"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
