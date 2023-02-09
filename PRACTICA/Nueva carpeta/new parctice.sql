Create table Personas(
Cod_persona int primary key AUTO_INCREMENT,
DNI_persona Varchar(10) Unique,
Nombre varchar(50) Not null comment 'Este es el nombre del usuario',
teléfono int default 00000000
)
comment = 'tabla personas'
auto_increment = 10000
Engine = InnoDB;

-- estructura de la tabla
describe table Persona;
describe Personas;

-- Muestra el script cómo se creóla tabla
show create table Personas;

-- Muestra información de cada atributo o columna
show full columns from Personas;

Create table Inmueble(
Id_inmueble int primary Key auto_increment,
direccion varchar(50),
Precio_act decimal(12,2) default(0)
)
engine = INNODB;


Create table Clientes(
Cod_persona int primary key,
Tipo_cliente enum('Vip', 'normal', 'inmobiliaria'),
foreign key (Cod_persona) references Personas(Cod_persona) on delete cascade on update cascade
)
engine = InnoDB;

Create table Trabajadores(
Cod_persona int primary key,
Teléfono_trabajo int not null default 000000000,
foreign key (Cod_persona) references Personas(Cod_persona) on delete cascade on update cascade
)engine = InnoDB;

create table Inmueble(
Id_inmueble int primary key auto_increment,
direccion varchar(50),
Precio_act decimal(12,2) default 0
)
engine = InnoDB;

Create table Pisos(
Id_inmueble int primary key,
tipo enum('chalet', 'apartamento', 'duplex', 'casa de pueblo'),
jardin boolean default false,
-- primary key (Id_inmueble),
foreign key (Id_inmueble) references Inmueble(Id_inmueble) on delete cascade on update cascade
)
engine = InnoDB;

create table Locales(
Id_inmueble int primary key,
bano boolean,
foreign key (Id_inmueble) references Inmueble(Id_inmueble) on delete cascade on update cascade
)
engine = InnoDB;

create table Garajes(
Id_inmueble int primary key,
foreign key (Id_inmueble) references Inmueble(Id_inmueble) on delete cascade on update cascade,
Numero int default 0,
planta int default 0
)
engine = InnoDB;

create table Alquiler(
Id_inmueble int,
Num_alquiler int,
Cod_cliente int,
Cod_vendedor int,
primary key (Id_inmueble, Num_alquiler),
foreign key (Id_inmueble) references Inmueble(Id_inmueble) on delete cascade on update cascade,
foreign key (Cod_cliente) references Clientes(Cod_persona) on delete set null on update cascade,
foreign key (Cod_vendedor) references Trabajadores(Cod_persona) on delete set null on update cascade
)
engine = InnoDB;

create table Compra(
Id_inmueble int,
Num_compra int,
Fecha date,
Valor_compra decimal(12,2) not null,
primary key (Id_inmueble, Num_compra),
foreign key (Id_inmueble) references Inmueble(Id_inmueble) on delete no action on update no action
)
engine = InnoDB;

create table Realizar_compra(
Id_inmueble int,
Num_compra int,
Cod_persona int,
primary key (Id_inmueble, Num_compra, Cod_persona),
foreign key (Id_inmueble, Num_compra) references Compra(Id_inmueble, Num_compra) on update no action on delete cascade,
foreign key (Cod_persona) references Personas(Cod_persona) on delete no action on update cascade
)
engine = InnoDB;