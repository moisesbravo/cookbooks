#actualiza Cliente
execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end


# Instala Cliente Mysql 
mysql_client 'default' do
  action :create
end



# Conectarse a la base de datos.

