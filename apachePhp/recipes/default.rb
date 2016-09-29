#
# Cookbook Name:: apachePhp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe "apache2"
include_recipe "apt"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_deflate"
include_recipe "apache2::mod_headers"
include_recipe "iptables"
#include_recipe "php5-ppa"

#habilita el puerto 80
iptables_rule 'http' do
  action :enable
end



#apt-get -y update
execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

#add-apt-repository ppa:ondrej/php
apt_repository 'php5.6' do
  uri          'ppa:ondrej/php'
end
#apt-get -y update
execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end


package "php5.6" do
  action :install
end

#apt-get -y install php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl
node['apachePhp']['modules'].each do |install_packages|
  package install_packages do
    action :install
  end
end


#Cambia el sitio por defecto de apache.
apache_site "default" do
  enable false
end


directory node["apachePhp"]["path"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

#crea el el virutal host  para la aplicacion.
web_app 'apachePhp' do
  template 'site.conf.erb'
  docroot node['apachePhp']['path']
  server_name node['apachePhp']['server_name']
end