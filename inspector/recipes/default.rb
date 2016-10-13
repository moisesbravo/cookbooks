#
# Cookbook Name:: inspector
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


## Descargar e Instalar agente de inspector

##wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install

execute 'download-inspector' do
  command "wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install"
end
##
##execute 'install-inspector' do
#  command "sudo bash install"
#end

