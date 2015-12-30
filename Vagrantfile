# -*- mode: ruby -*-
# vi: set ft=ruby :

# Make sure that vagrant-cachier is available. If not, simply exit.
unless Vagrant.has_plugin?('vagrant-cachier')
  raise 'The vagrant-cachier plugin is not available. Please make sure you have installed it for your platform.'
end

Vagrant.configure(2) do |config|
  config.vm.box               = 'ubuntu/trusty64'   # This defines what base system to install.
  config.vm.hostname          = 'ALProcessDocs'     # This is the host name that will be used accross the instance network.
  config.vm.define            :al_process_docs      # This set up the instance name in vagrant management system.

  # Network port foewarding configuration.
  config.vm.network           :forwarded_port, guest: 5000, host: 5000

  # Set up SSH options. This allows to forward the local SSH keys to the instance, so git can use them.
  config.ssh.forward_agent    = true

  # Make this box run with VirtualBox.
  config.vm.provider        :virtualbox do |vm|
    vm.name                   = 'ALProcessDocs'
    vm.gui                    = false
    vm.check_guest_additions  = true
    vm.cpus                   = 2
    vm.memory                 = 2048
  end

  # Install requirements...
  config.vm.provision   :shell, privileged: true,
                                path:       'vagrant/setup-system.sh'
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
