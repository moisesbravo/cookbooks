default["apachePhp"]["path"] = "/var/www/phpapp"
default['apachePhp']['server_name'] = "phpapp"


   
default['apachePhp']['modules'] = [
  'php5.6-mcrypt',
  'php5.6-mbstring',
  'php5.6-curl',
  ' php5.6-cli',
'php5.6-mysql',
'php5.6-gd',
 'php5.6-intl',
 'php5.6-xsl'
]


default[:deploy] = {}