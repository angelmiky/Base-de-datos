-- CONSULTAS SELECT SENCILLAS

-- Lista el nombre de todos los productos que hay en la tabla producto.

select nombre from producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.

select nombre, precio from producto;

-- Lista todas las columnas de la tabla producto.

select * from producto;

-- Lista el nombre de los productos, el precio en euros

select nombre, precio from producto;


-- Lista los nombres de los fabricantes ordenados de forma ascendente.

select nombre from fabricante order by nombre ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.

select nombre from fabricante order by nombre DESC;

-- Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

select nombre from producto where id=2;
select * from producto where id=2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.

select nombre from producto where precio <= 120;
select * from producto where precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

select nombre from producto where precio >= 400;
select * from producto where precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

select nombre from producto where precio <= 400;
select * from producto where precio <= 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

select nombre from producto where precio >= 80 and precio <=300;
select * from producto where precio >= 80 and precio <=300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

select nombre from producto where precio between 60 and 200;
select * from producto where precio between 60 and 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.

select * from producto where precio > 200 and id_fabricante=6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

select * from producto where id_fabricante=1 OR id_fabricante =3 OR id_fabricante=5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

select * from producto where id_fabricante IN (1, 3, 5);

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

select * from fabricante where nombre like "S%";
select * from fabricante;

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

select * from fabricante where nombre like "%e";

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

select * from fabricante where nombre like "%w%";

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

select * from fabricante where nombre like "____";

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

select * from producto where nombre like "%Portátil%";

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

select * from producto where nombre like "%Monitor%" and precio<215;
select * from producto;