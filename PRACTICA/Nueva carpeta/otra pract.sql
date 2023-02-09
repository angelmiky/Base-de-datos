Select "Estadisticas de paises","" from dual
union
select "superficie total del mundo", cast(sum(SurfaceArea) as char) from country
union
Select "Paises con esperanza de vida mayor de 60 años",cast(count(*) as char) from country 
where LifeExpectancy >60
union
Select "Paises con esperanza de vida mayor de 70 años",cast(count(*) as char) from country 
where LifeExpectancy >70
union
Select "Paises con esperanza de vida mayor de 75 años",cast(count(*) as char) from country 
where LifeExpectancy >75
union
Select "Poblacion total mundial", cast(sum(population) as char) from country

union
select "Paises con mas de 30 millones de habitants", cast(count(*) as char) from country 
where population >30000000

