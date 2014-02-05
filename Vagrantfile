Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-1304"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.host_name = 'rails-dev-box'
  config.vm.forward_port 3000, 3000
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
    chef.roles_path     = "chef/roles"
    chef.data_bags_path = "chef/data_bags"
    chef.add_role "rails-development"
    chef.json = {
        "rbenv" => {
          "global"  => "2.1.0",
          "rubies" => [ "2.1.0" ],
          "gems" => {
            "2.1.0" => [
              { 'name' => 'bundler' }
            ]
          }
        }
      }
  end
end
