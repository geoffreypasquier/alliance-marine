Vagrant.configure(2) do |config|
  config.vm.box = "akeneo/demo_maker"
  config.vm.box_version = "~> 5.0.0"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.ssh.username = "akeneo"
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--name", "alliance_marine"]
    v.memory = "4096" # 4096 or upper otherwise ElasticSearch makes it swapping too much.
    v.cpus = "2"
  end
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.network "forwarded_port", guest: 80, host: 8072

  # uncomment the line below to enable private network
  # config.vm.network :private_network, ip: "10.0.0.11"

  config.vm.synced_folder "data", "/home/akeneo/presales/data/demo_maker/generator"
  config.vm.synced_folder "data/images", "/home/akeneo/presales/data/demo_maker/api/images"
  config.vm.synced_folder "data/assets", "/home/akeneo/presales/data/demo_maker/api/assets"


  # config.vm.synced_folder "resources/Acme", "/home/akeneo/pim/src/Acme" # Uncomment to do custom devs


  config.vm.provision :shell do |shell|
    shell.keep_color = true
    shell.path = "resources/bootstrap.sh"
    shell.name = 'bootstrapLoader'
    shell.privileged = false
  end


  config.vm.provision "shell" do |shell|
    shell.inline = "[ ! -f /home/akeneo/presales/vagrant/install-ga.sh ] || /home/akeneo/presales/vagrant/install-ga.sh akeneo 'offline_demo_maker_alliance_marine' "
    shell.privileged = false
  end
  config.vm.provision "shell", inline: <<-SHELL
    echo Akeneo PIM is accessible at http://localhost:8072;
  SHELL
end
