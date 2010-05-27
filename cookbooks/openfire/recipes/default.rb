# -*- coding: utf-8 -*-

# Download the latest OpenFire server
remote_file "/vagrant/openfire_3.6.4_all.deb" do
  source "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_3.6.4_all.deb"
  checksum "ef143f2f017b23fac7b04572837a0001"
  not_if "test -f /vagrant/openfire_3.6.4_all.deb"
end

# Install the OpenFire server"
execute "install-openfire" do
  command "sudo dpkg -i /vagrant/openfire_3.6.4_all.deb"
  action :run
end

service "openfire" do
  supports :restart => true, :start => true
  action [ :start ]
end

# Ensure that mechanize is installed
package "libxslt1-dev"
package "libxml2-dev"
gem_package "mechanize"

# Run the setup_openfire.rb script
execute "setup_openfire.rb" do
  command "ruby /vagrant/setup_openfire.rb #{@node[:openfire][:admin][:password]}"
  user "root"
  action :run
end

# Restart the openfire server
service "openfire" do
  supports :restart => true, :start => true
  action [ :restart ]
end
