#
# Cookbook Name:: apachePhp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe "apache2"
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
  enable true
end


