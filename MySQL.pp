$bindadress='0.0.0.0'
$rootpassword=''
$usuario='edu'
$usuariopassword=''
$db='edu-test'
$reinicio=true

class { '::mysql::server':
  override_options => { 'mysqld' => { 'bind-address' => $bindaddress } },
  restart => $reinicio,
  root_password => $rootpassword
}
mysql::db { $db:
  user     => $usuario,
  password => $usuariopassword,
  host     => '%',
  grant    => [ 'SELECT' , 'INSERT' , 'UPDATE' , 'DELETE' , 'DROP' , 'CREATE' ,
                  'ALTER' , 'CREATE VIEW' , 'SHOW VIEW' , 'TRIGGER' , 'LOCK TABLES' ],
}
mysql_grant { "${usuario}@%/*.*":
  ensure     => 'present',
  table      => '*.*',
  options    => ['GRANT'],
  privileges => [ 'ALL' ],
  user       => "${usuario}@%",
}
