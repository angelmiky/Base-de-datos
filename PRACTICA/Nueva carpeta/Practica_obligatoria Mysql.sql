CREATE DATABASE HOTEL;

create table HOTELES (
nombre varchar(50) primary key,
ubicacion varchar(100) null,
numero_habitaciones int null
);
alter table HOTELES
drop nombre;
alter table HOTELES
add id_hotel int primary key  auto_increment first;
alter table HOTELES comment= 'Esta es tabla creada que se ha añadido id_hotel como clave primaria y en primera posiscion'; 

create table HABITACIONES (
id_habitacion int not null primary key auto_increment,
numero int,
planta int,
metros_cuadrados int,
nombre_hotel varchar(50),
constraint num_uno foreign key (nombre_hotel) references HOTELES (nombre)
);
alter table HABITACIONES drop constraint num_uno;
show create table HABITACIONES;
alter table HABITACIONES drop nombre_hotel;
describe HABITACIONES;

show create table HABITACIONES;
alter table HABITACIONES drop constraint num_dos;
alter table HABITACIONES 
add id_hotel int;
alter table HABITACIONES
drop id_habitacion;
alter table HABITACIONES
add primary key (id_hotel,numero,planta);
alter table HABITACIONES
add foreign key (id_hotel) references HOTELES (id_hotel);
alter table HABITACIONES comment= 'Tabla HOTELES que se borra la restriccion uno y restriccion dos 
para añadir dos claves primarias y una clave ajena referenciada a la tabla HOTELES';

create table CLIENTES (
dni_cliente varchar(10) not null primary key,
nombre varchar(50) null,
edad int null
);

create table RESERVAS (
id_reserva int not null primary key auto_increment,
id_habitacion int,
constraint num_tres foreign key (id_habitacion)  references HABITACIONES (id_habitacion),
fecha date
);
show create table RESERVAS;

alter table RESERVAS
drop foreign key reservas_ibfk_2;

alter table RESERVAS
drop id_habitacion;
alter table RESERVAS
rename column fecha to fecha_reserva;
alter table RESERVAS
add column (planta int, numero int, id_hotel int);

alter table RESERVAS
drop id_reserva;
alter table RESERVAS
add primary key (id_hotel,numero,planta, fecha_reserva);

alter table RESERVAS
drop primary key;

alter table RESERVAS
add foreign key (id_hotel,numero,planta) references HABITACIONES (id_hotel,numero,planta);
 alter table RESERVAS comment= 'Tabla RESERVAS se borra su clave externa y un campo id_habitacion
 se cambia la columna fecha por fecha_reserva, para añadir las columnas planta, numero e id_hotel
 se borra la clave primaria id_reserva y se añaden las creadas anteriormente como clave primaria
 para que luego sean clave externas que referencian a ala tabla HABITACIONES';
 
 alter table RESERVAS
 drop reservas_ibfk_1;
 
create table CLIENTESRESERVAN (
id_reserva int not null,
dni_cliente varchar(10) not null ,
primary key (id_reserva, dni_cliente),
foreign key (id_reserva) references RESERVAS (id_reserva),
foreign key (dni_cliente ) references CLIENTES (dni_cliente)
);
 rename table CLIENTESRESERVAN to 
 reservas_habitaciones_clientes;
 
 show create table reservas_habitaciones_clientes;
 
alter table reservas_habitaciones_clientes
drop foreign key reservas_habitaciones_clientes_ibfk_1;

alter table reservas_habitaciones_clientes
drop primary key;

alter table reservas_habitaciones_clientes
add column (numero int , planta int , id_hotel int, fecha date); 

alter table reservas_habitaciones_clientes
drop fecha;

alter table reservas_habitaciones_clientes
add column fecha_reserva date;

alter table reservas_habitaciones_clientes
add primary key (numero, planta, id_hotel, fecha_reserva);

alter table reservas_habitaciones_clientes
drop primary key;

alter table reservas_habitaciones_clientes
add foreign key (dni_cliente) references CLIENTES (dni_cliente);

alter table reservas_habitaciones_clientes
add foreign key (id_hotel, numero, planta , fecha_reserva) references RESERVAS ( id_hotel, numero, planta , fecha_reserva);

