Vagrant.configure("2") do |config|

  $docker_install = <<-SCRIPT
  sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine -y
  sudo yum install -y yum-utils
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo -y
  sudo yum install -y docker-ce docker-ce-cli containerd.io
  sudo yum install -y git
  usermod -aG docker vagrant
  sudo systemctl start docker
  sudo docker swarm init --advertise-addr 192.168.33.20
  docker network create -d overlay proxy
  SCRIPT

  config.vm.define "cicd" do |cicd|
    cicd.vm.box = "centos/7"

    cicd.vm.provision "shell", inline: $docker_install

    cicd.vm.network "private_network", ip: "192.168.33.20"

    cicd.vm.provider "virtualbox" do |vb|
      vb.name = "cicd"
      vb.memory = "2048"
      vb.cpus = 2
      end
  end
end
