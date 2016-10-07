
app = search(:aws_opsworks_app).first
app_path = node["apachePhp"]["path"]
app_proyecto = node["apachePhp"]["proyecto"]
app_deploy =node["apachePhp"]["deploy"]

package "git" do
  # workaround for:
  # WARNING: The following packages cannot be authenticated!
  # liberror-perl
  # STDERR: E: There are problems and -y was used without --force-yes
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "14.04"
end


  git app_deploy do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
     action :sync
  end

bash "install_deploy" do
  code <<-EOL
  mv   #{app_proyecto}/*  #{app_path} 
  rm -r  #{app_deploy}

  EOL
end