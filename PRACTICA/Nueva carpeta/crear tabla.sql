CREATE TABLE Alumnos(
dni_alumno		char(9)	PRIMARY KEY,
nombre varchar(50),
telefono char(9),
direccion varchar(50),
edad int,
categoria char,
sexo char,
repetidor boolean,
nota_media int,
fecha_nac int,
dni_delegado varchar(50),
constrain dni_delegados foreing key (dni_delegado)
reference alumnos(dni_alumno)
);
