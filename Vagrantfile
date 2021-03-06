# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # There are some problems with other boxes, but this one works.
  # See https://bugs.launchpad.net/cloud-images/+bug/1569237/comments/57
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.network :private_network, ip: "192.168.22.22"
  config.vm.hostname = "jenkins-slave"
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
  end

  config.vm.provision :file do |file|
    file.source = "packer/scripts"
    file.destination = "/tmp"
  end

  $script = <<-SCRIPT
    /tmp/stop-and-remove-daily-apt.sh
    /tmp/full-upgrade.sh
    /tmp/cleanup.sh
  SCRIPT

  config.vm.provision "shell", inline: $script

  # Provision VM using the main Ansible playbook.
  config.vm.provision :ansible do |ansible|
    ansible.compatibility_mode = "2.0"
    ansible.inventory_path = "ansible/inventories/dev/hosts"
    ansible.verbose = "v"
    ansible.playbook = "ansible/site.yml"
    ansible.config_file = "ansible/ansible.cfg"
    ansible.limit = "all"  # Do not limit the hosts here; do it in the playbook instead.
    # ansible.tags = "docker"
  end
end
