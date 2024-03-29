-- 2. SELECT from World

-- 1. Show the name, continent and population of all countries.
SELECT name, continent, population 
FROM world;

-- 2. Show the name for the countries that have a population of at least 200 million.
SELECT name
FROM world
WHERE population >= 200000000;

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population 'Per Capita GDP'
FROM world
WHERE population >=200000000;

-- 4. Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population/1000000 AS 'Population'
FROM world
WHERE continent = 'South America';

-- 5. Show the name and population for France, Germany, Italy.
SELECT  name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6. Show the countries which have a name that includes the word 'United'.
SELECT name
FROM world
WHERE name LIKE '%united%';

-- 7. Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000;

-- 8. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000
XOR population > 250000000;

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name, ROUND(population/1000000, 2) AS 'Population (millions)', ROUND(GDP/1000000000, 2) AS 'GDP (billions)'
FROM world
WHERE continent = 'South America';

-- 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(GDP/population, -3) AS 'Per-Capita GDP'
FROM world
WHERE GDP > 1000000000000;

-- 11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

-- 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital,1)
AND name <> capital;

-- 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';

-- SELECT from World BBC Quiz
-- 1. Select the code which gives the name of countries beginning with U.
SELECT name
FROM world
WHERE name LIKE 'U%'

-- 2. Select the code which shows just the population of United Kingdom.
SELECT population
FROM world
WHERE name = 'United Kingdom'

-- 3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
SELECT continent 
FROM world 
WHERE 'name' = 'France'
-- B - 'name' should be name

-- 4. Select the result that would be obtained from the following code:
SELECT name, population / 10 
FROM world 
WHERE population < 10000
-- D - Nauru, 990

-- 5. Select the code which would reveal the name and population of countries in Europe and Asia.
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')

-- 6. Select the code which would give two rows.
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')

-- 7. Select the result that would be obtained from this code:
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000
-- C - Brazil, Colombia