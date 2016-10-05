
app = search(:aws_opsworks_app).first
app_path = node["apachePhp"]["path"]

package "git" do
  # workaround for:
  # WARNING: The following packages cannot be authenticated!
  # liberror-perl
  # STDERR: E: There are problems and -y was used without --force-yes
  options "--force-yes" if node["platform"] == "ubuntu" && node["platform_version"] == "14.04"
end


  git app_path do
    repository app["app_source"]["url"]
    revision app["app_source"]["revision"]
     action :sync
  end

