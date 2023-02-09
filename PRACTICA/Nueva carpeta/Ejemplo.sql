-- ciudades

SELECT * FROM city;

-- distritos de ciudades que empiezen con B
SELECT * FROM city WHERE District LIKE 'B%';

-- ciudades cuya nombre empieza con l
SELECT * FROM city WHERE NAME LIKE 'L%';

-- ciudades con poblacion mayor a 90000
SELECT * FROM city WHERE Population > 90000;

-- ciudades con codigos que empiezen con letra A
SELECT * FROM city WHERE CountryCode LIKE 'A%';

-- ciudades que existan 
