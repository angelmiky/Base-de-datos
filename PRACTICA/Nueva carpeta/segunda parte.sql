# BBDD para modificar

drop database if exists bibliotecas ;

create database bibliotecas;

use bibliotecas;

create table editoriales
(nombre varchar(25) primary key,
direccion varchar(50));

create table usuario(
dni varchar(10) primary key,
nombre varchar(25),
edad int,
telefono int);
-- Añadir un campo id_usuario que sea entero en la tabla usuarios.
alter table usuario
add id_usuario int;
-- Borra la clave primaria de la tabla  usuario (no borres la columna).
alter table usuario
drop primary key;
-- Establecer ese campo id_usuario de la tabla usuario como clave primaria y autoincrement.
alter table usuario
modify column id_usuario  int primary key auto_increment;
-- Establece el campo dni de la tabla usuario como único
alter table usuario
modify column dni int unique;

create table estanteria(
id_estaneria int,
ubicacion varchar(50));
create table autor(
id_autor int primary key,
nombre varchar (25),
nacionaliad varchar (30),
direccion varchar(35)
);

create table libro (
isbn varchar (15),
titulo varchar(40),
tema varchar(40),
nombre_editorial varchar(25),
dni_usuario varchar(10) unique,
id_estanteria int ,
letra char(1),
foreign key (nombre_editorial) references editoriales(nombre),
foreign key (dni_usuario) references usuario(dni)
);

show create table libro;
alter table libro
drop foreign key libro_ibfk_2;
-- Cambiar el campo dni_usuario de la tabla libro a id_usuario y en vez de ser una cadena de caracteres será un entero
alter  table libro
modify column dni_usuario int;
-- Establece una nueva clave foránea en la tabla libros que haga referencia a la nueva calve primaria de usuario (id_usuario) on delete set null on update cascade.
alter table libro
add foreign key (dni_usuario) references usuario (id_usuario) on delete set null on update cascade;



create table escribe
(id_autor int,
isbn varchar(15)
);

alter table escribe
rename escribe_libros;