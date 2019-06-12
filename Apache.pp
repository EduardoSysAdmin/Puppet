$certificado='/usr/bin/openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -subj "/C=GB/ST=Madrid/L=Madrid/O=Global Security/OU=IT Department/CN=eog.com"'
$comprobacion='/etc/ssl/certs/apache-selfsigned.crt'

$puertonoseguro='80'
$puertoseguro='443'

$documentrootnoseguro='/var/www/devops'
$documentrootseguro='/var/www/ssl'

$sslcert='/etc/ssl/certs/apache-selfsigned.crt'
$sslkey='/etc/ssl/private/apache-selfsigned.key'

$indexs='/var/www/ssl/index.html'
$indexdnoseguro='/var/www/devops/index.html'
$indexdseguro='/var/www/ssl/index.html'

exec { 'creacion de certificados':
  command => $certificado,
  creates => $comprobacion,
}
class { 'apache':
  default_vhost => false,
}
apache::vhost { 'devops.eog.com':
  port    => $puertonoseguro,
  docroot => $documentrootnoseguro,
  docroot_owner => 'www-data',
  docroot_group => 'www-data',
}
apache::vhost { 'ssl.eog.com':
  port     => $puertoseguro,
  docroot  => $documentrootseguro,
  ssl      => true,
  ssl_cert => $sslcert,
  ssl_key  => $sslkey
}
file { $indexdnoseguro:
          ensure => present,
          source => $indexs,
}
file { $indexdseguro:
          ensure => present,
          source => $indexs,
}
