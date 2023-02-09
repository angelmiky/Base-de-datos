# Ejecuta el siguiente script.
# Busca busca los errores y corrígelos

drop database if exists oficina_mal;
use oficina_mal; -- no se puede usar porque no esta creada, primero se tiene que crear la base de datos y usarla
create database oficina_mal;

CREATE TABLE habitacion (
   id_hotel int(11) NOT NULL ,
   id_habitacion int(11) NOT NULL,
   primary key(id_hotel,id_habitacion)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

   CREATE TABLE puesto (
   id_puesto int(11) NOT NULL,
   descr varchar(30) DEFAULT NULL,
   PRIMARY KEY (id_puesto)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE empleado (
   dni varchar(10) NOT NULL PRIMARY KEY,
   nss int(11) DEFAULT NULL,
   id_puesto int(11) DEFAULT NULL,
   id_hotel int(11) DEFAULT NULL,
   id_habitacion int(11) DEFAULT NULL,
   CONSTRAINT empleado_ibfk_3 FOREIGN KEY (id_puesto) REFERENCES puesto (id_puesto) ON DELETE SET NULL ON UPDATE CASCADE,
   CONSTRAINT empleado_ibfk_4 FOREIGN KEY (id_hotel,id_habitacion) REFERENCES habitacion (id_hotel,id_habitacion) on delete set null on update cascade
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
drop table empleado;
 


select * from habitacion;
select * from empleado;
select * from puesto;

select * from habitacion where id_hotel=1;
select * from empleado where id_habitacion=1 and id_hotel=1;
update empleado set id_habitacion = 4 where id_hotel=1;
select * from empleado where id_habitacion=4 and id_hotel=1;

