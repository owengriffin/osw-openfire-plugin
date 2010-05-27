# -*- coding: utf-8 -*-
include_recipe "apt"
include_recipe "apache2"
apache_module "rewrite"
apache_module "proxy"

# Download the openfire plugin if it does not already exist
remote_file "/vagrant/osw-openfire-plugin-0.6.0.tgz" do
  source "http://github.com/downloads/onesocialweb/osw-openfire-plugin/osw-openfire-plugin-0.6.0.tgz"
  not_if "test -f /vagrant/osw-openfire-plugin-0.6.0.tgz" 
end

include_recipe "openfire"
