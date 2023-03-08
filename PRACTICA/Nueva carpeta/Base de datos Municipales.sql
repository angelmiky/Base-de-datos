drop database if exists municipales;

create database municipales CHARACTER SET = 'latin1';
use municipales;

# Script para crear partidos_politicos y politicos
create table partidos_politicos
(siglas char (4) primary key,
id_partido int unique,
nombre varchar(30),
direccion varchar(30),
Localidad varchar(30),
Fecha_alta date);

create table politicos (
dni varchar(10) primary key,
partido char(4),
primer_apellido varchar (25),
segundo_apellido varchar (25),
Edad int,
foreign key (partido) references partidos_politicos(siglas));

create table Municipio(
Cod_municipio int primary key auto_increment,
Nombre varchar(25) not null,
Provincia varchar(25) not null,
Num_censados int not null,
Tipo enum('ciudad', 'Pueblo')
) auto_increment = 1000;


create table Colegio_electorales(
Cod_municipio int,
Cod_colegio int,
primary key (Cod_municipio, Cod_colegio),
Direccion varchar(50),
Nombre varchar(50) not null,
foreign key (Cod_municipio) references Municipio (Cod_municipio) on delete no action on update cascade
);

create table Mesa_electoral(
Cod_municipio int,
Cod_colegio int,
Letra char (1),
primary key (Cod_municipio, Cod_colegio, Letra),
foreign key (Cod_municipio, Cod_colegio) references Colegio_electorales (Cod_municipio, Cod_colegio) On delete set null on update cascade
);

create table Candidato(
Dni varchar(10),
Puesto varchar(50) not null,
municipio int,
foreign key (municipio) references Municipio (Cod_municipio) on delete set null on update cascade
);

create table Elegido(
Dni varchar(10) primary key,
Cargo varchar(50) not null,
municipio int,
foreign key(municipio) references Municipio (Cod_municipio) on delete set null on update cascade
);

create table Obtiene_votos(
Distrito int,
Seccion int,
Letra char,
Siglas char,
Num_votos int not null,
primary key(Distrito, Seccion, Letra, Siglas)
);

create table Resultado_municipio(
Cod_municipio int,
Siglas char,
Por_votos decimal(5,2) not null,
Num_concejales int default 0,
Num_votos int,
primary key (Cod_municipio, Siglas),
foreign key (Cod_municipio) references Municipio (Cod_municipio) on delete cascade on update cascade
);

