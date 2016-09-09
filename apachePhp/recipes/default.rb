#
# Cookbook Name:: apachePhp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_deflate"
include_recipe "apache2::mod_headers"
include_recipe "iptables"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2::mod_php5"

#habilita el puerto 80
iptables_rule 'http' do
  action :enable
end




#Cambia el sitio por defecto de apache.
apache_site "default" do
  enable false
end


directory node["phpapp"]["path"] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

#crea el el virutal host  para la aplicacion.
web_app 'phpapp' do
  template 'site.conf'
  docroot node['phpapp']['path']
  server_name node['phpapp']['server_name']
end