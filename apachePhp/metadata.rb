name 'apachePhp'
maintainer 'Moises Bravo'
maintainer_email 'moises.bravo@komatsu.cl'
license 'all_rights'
description 'Installs/Configures apachePhp'
long_description 'Installs/Configures apachePhp'
version '0.1.0'
recipe "apachePhp", "instalacion Stack Apache"

depends "iptables"
depends "apache2"
depends 'mysql', '~> 8.0'
#depends "php5-ppa"

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/apachePhp/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/apachePhp' if respond_to?(:source_url)
