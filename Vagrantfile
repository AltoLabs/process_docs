# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure that vagrant-cachier is available. If not, simply exit.
unless Vagrant.has_plugin?('vagrant-cachier')
  raise 'The vagrant-cachier plugin is not available. Please make sure you have installed it for your platform.'
end

Vagrant.configure(2) do |config|
  # Store the host operating system name.
  host                    = RbConfig::CONFIG['host_os']

  config.vm.box           = 'ubuntu/trusty64'   # This defines what base system to install.
  config.vm.hostname      = 'ALProcessDocs'     # This is the host name that will be used accross the instance network.
  config.vm.define        :al_process_docs      # This set up the instance name in vagrant management system.

  # This is for NFS configuration.
  if host =~ /darwin|linux/
    config.vm.network         :private_network, ip: '172.31.42.42'
    config.vm.synced_folder   '.', '/vagrant', id: 'vagrant', nfs: true
  else
    config.vm.synced_folder   '.', '/vagrant', id: 'vagrant', type: 'rsync', rsync__exclude: '.git/'
  end

  # Network port foewarding configuration.
  config.vm.network           :forwarded_port, guest: 5000, host: 5000

  # Set up SSH options. This allows to forward the local SSH keys to the instance, so git can use them.
  config.ssh.forward_agent    = true

  # Make this box run with VirtualBox.
  config.vm.provider  :virtualbox do |vm|
    vm.name                   = 'AltoLabs Process Docs Development'
    vm.gui                    = false
    vm.check_guest_additions  = true
    vm.cpus                   = 2
    vm.memory                 = 2048
  end

  # Install requirements...
  config.vm.provision   :shell, inline: <<-SHELL
    echo "Complettelly removing AppArmor..."
    service apparmor stop
    update-rc.d -f apparmor remove
    apt-get --purge remove apparmor apparmor-utils libapparmor-perl libapparmor1

    echo "Updating system..."
    apt-get -y update && apt-get -y dist-upgrade

    echo "Installing system requirements..."
    apt-get install -y  bash curl git patch bzip2 openssl libreadline6 libreadline6-dev curl git-core \
                        zlib1g zlib1g-dev libssl-dev libyaml-dev libffi-dev libsqlite3-dev sqlite3 libxml2-dev \
                        libxslt-dev autoconf libc6-dev libgdbm-dev libncurses5-dev  automake libtool bison pkg-config

    echo "Installing Dynamic Kernel Module System..."
    apt-get install -y  linux-headers-generic build-essential dkms
  SHELL

  # Install requirements...
  config.vm.provision   :shell, inline: <<-SHELL
    echo "Installing the Redis, MemCached as well as a Javascript runtime..."
    apt-get install -y  redis-server memcached nodejs nodejs-legacy npm
    echo "Installing bower..."
    npm install -g bower

    echo "Cleaning-up the package system..."
    apt-get autoremove -y --purge
  SHELL

  config.vm.provision   :shell, privileged: false,
                                path:       'vagrant/install-rvm.sh',
                                args:       'stable'
  config.vm.provision   :shell, privileged: false,
                                path:       'vagrant/setup-app.sh'

  # This is the completion message.
  config.vm.post_up_message = <<-EOF
    Your development environement is ready.

    WARNING: When changing files within the /vagrant folder, keep in mind that it is in fact
      your local version of the project being mounted inside the instance that you're editing!

    If you just booted this instance, please make sure you've installed the latest guest additions
    for the virtualization software you're using.

    For more informations, please contact the maintainer of this script:
      HERAULT-MARTIN Pierre: HicksCorp@GMail.com
  EOF
end
