drop database if exists empleados;
create database empleados;
use empleados;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
) ENGINE=INNODB;

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','O''Donnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

-- 1. Selecciona el apellido de todos los empleados.
select LastName from Employees;

-- 2. Selecciona el apellido de todos los empleados, sin duplicados.
select distinct LastName from Employees;
 
-- 3. Selecciona todos los datos de los empleados cuyo apellido sea "Smith".
select * from Employees where LastName like 'Smith';

-- 4. Selecciona todos los datos de los empleados cuyo apellido sea "Smith" o "Doe". (Con OR y Con IN) 
select * from Employees where LastName like 'Smith' or LastName like 'Doe';

-- 5. Selecciona todos los datos de los empleados que trabajan en el departamento 14.

-- 6. Selecciona todos los datos de los empleados que trabajan en el departamento 37 o el departamento 77. (Con OR y Con IN) 

-- 7. Selecciona todos los datos de los empleados cuyo apellido comience con una "S".

-- 8. Selecciona la suma de los presupuestos de todos los departamentos.

-- 9. Selecciona la cantidad de empleados en cada departamento (solo se necesita mostrar el código del departamento y la cantidad de empleados).

-- 10. Selecciona todos los datos de los empleados, incluidos los datos del departamento de cada empleado.

-- 11. Seleccione el nombre y apellido de cada empleado, junto con el nombre y presupuesto del departamento del empleado. 

-- 12. Seleccione el nombre y apellido de los empleados que trabajan para departamentos con un presupuesto mayor a $60,000.

-- 13. Seleccione los departamentos con un presupuesto mayor que el presupuesto promedio de todos los departamentos.

-- 14. Seleccione los nombres de los departamentos con más de dos empleados. 

-- 15. Seleccione el nombre y apellido de los empleados que trabajan para los departamentos con el segundo presupuesto más bajo.
