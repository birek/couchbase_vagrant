# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

 (1..2).each do |i| 
  config.vm.define "node-#{i}" do |node|
    node.vm.box = "puppetlabs/centos-6.6-64-nocm"
    node.vm.network "private_network", ip: "33.33.33.10#{i}"
    node.vm.provision :chef_solo do |chef|
    node.berkshelf.berksfile_path = "cookbooks/cbryan/Berksfile"
    node.berkshelf.enabled = true
    chef.json = {
     }
 
     chef.run_list = [
       "recipe[cbryan]",
       "recipe[cbryan::node-#{i}]"
     ]
    end
  end
 end

end
