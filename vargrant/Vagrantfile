Vagrant.configure("2") do |config|    
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.gui = true
    end

    config.vm.define "sshtest" do |sshtest|
        sshtest.vm.box = "bento/ubuntu-16.04"
        config.vm.provision :shell, path: "installAndCongirue_openssh.sh"
    end
end