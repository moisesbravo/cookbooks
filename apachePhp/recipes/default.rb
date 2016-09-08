#
# Cookbook Name:: apachePhp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe "apache2"
include_recipe "iptables"

#habilita el puerto 80
iptables_rule 'http' do
  action :enable
end




#Cambia el sitio por defecto de apache.
apache_site "default" do
  enable true
end

#crea el el virutal host  para la aplicacion.
web_app 'phpapp' do
  template 'site.conf.erb'
  docroot node['phpapp']['path']
  server_name node['phpapp']['server_name']
end