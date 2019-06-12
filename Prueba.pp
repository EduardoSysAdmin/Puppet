$archivo="/tmp/IP-prueba"
$estado=present
$permisos='644'
$contenido="Direccion IP: ${ipaddress_ens33}.\n"

file {$archivo:
  ensure  => $estado,
  mode    => $permisos,
  content => $contenido,
}
