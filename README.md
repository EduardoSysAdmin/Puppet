# Puppet
## ¿Para qué sirve y qué es Puppet?
Puppet es una herramienta creada en 2005 por Luke Kanies y mantenida ahora por su empresa PuppetLabs, que sirve para administrar la configuración de sistemas, de forma más simple, automatizando las tareas repetibles.
Lo bueno que tiene Puppet, es que las configuraciones de las máquinas se pueden establecer a través de código, escribiéndolas en un lenguaje propio de Puppet.
Este lenguaje además, te permite abstraerte de las configuraciones del sistema, que están a más bajo nivel.

Con él puedes describir los recursos que una máquina debería tener (usuarios, grupos, paquetes, archivos, programas…etc.), en qué estado deberían estar y  las relaciones que existen entre ellos y Puppet se encargará del resto

## ¿Qué voy a encontrar en este repositorio?
Este repositorio lo he creado a nivel personal para hacer un **control de versiones en mi progreso** con los **scripts** para aprovisionar y configurar diferentes servicios en servidores. Estos scripts son de libre uso.

## Tabla de Scripts

| Script               | Descripción                                                                             |
| ------               | -----------                                                                             |
| Prueba.pp              | Este script es una pequeña prueba con variables para empezar a entender la sintáxis de Puppet            |
| MySQL.pp      | Este script aprovisionará nuestros clientes-servidores con una instalación completa de MySQL (instalación, bind-address ajustado, creación de usuario con todos los permisos(root))   |
| Apache.pp      | Este script aprovisionará nuestros clientes-servidores con una instalación de Apache con dos virtual host, uno no seguro y otro seguro. Para este último el script comprueba si existe un certificado que es el que se usa en el virtual host y si no existe lo genera.   |
