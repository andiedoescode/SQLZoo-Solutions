-- 0. SELECT basics

-- 1. Show the population of Germany.
SELECT population
FROM world
WHERE name = 'Germany';

-- 2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

-- SELECT Basics Quiz
-- 1. Select the code which produces this table.
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

-- 2. Pick the result you would obtain from this code:
SELECT name, population
FROM world
WHERE name LIKE "Al%"
-- E - Table-E

-- 3. Select the code which shows the countries that end in A or L.
SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

-- 4. Pick the result from the query
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'
-- C - table with Italy, Malta, Spain

-- 5. Pick the result you would obtain from this code:
SELECT name, area*2
FROM world
WHERE population = 64000
-- C - Table with Andora, 936

-- 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000.
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000

-- 7. Select the code that shows the population density of China, Australia, Nigeria and France.
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

----------

-- 1. SELECT name

-- 1. Find the country that start with Y.
SELECT name
FROM world
WHERE name LIKE 'Y%';

-- 2. Find the countries that end with y.
SELECT name
FROM world
WHERE name LIKE '%y';

-- 3. Find the countries that contain the letter x.
SELECT name
FROM world
WHERE name LIKE '%x%';

-- 4. Find the countries that end with land.
SELECT name
FROM world
WHERE name LIKE '%land'

-- 5. Find the countries that start with C and end with ia.
SELECT name
FROM world
WHERE name LIKE 'C%ia';

-- 6. Find the country that has oo in the name.
SELECT name 
FROM world
WHERE name LIKE '%oo%';

-- 7. Find the countries that have three or more a in the name.
SELECT name
FROM world
WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have "t" as the second character.
SELECT name
FROM world
WHERE name LIKE '_t%'
ORDER BY name;

-- 9. Find the countries that have two "o" characters separated by two others.
SELECT name
FROM world
WHERE name LIKE '%o__o%';

-- 10. Find the countries that have exactly four characters.
SELECT name
FROM world
WHERE name LIKE '____';

-- 11. Find the country where the name is the capital city.
SELECT name
FROM world
WHERE name LIKE capital;

-- 12. Find the country where the capital is the country plus "City".
SELECT name
FROM world
WHERE capital LIKE concat(name, ' City');

-- 13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

-- 14. Find the capital and the name where the capital is an extension of name of the country. But not where the capital is the same as the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%')
AND capital != name;

-- 15. Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.
-- The capital of Monaco is Monaco-Ville: this is the name Monaco and the extension is -Ville.
SELECT name, REPLACE(capital, name, '') AS 'Extension'
FROM world
WHERE capital LIKE CONCAT(name, '_%');

----------

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

----------

-- 3. SELECT from Nobel

-- Table of Nobel prize winners: nobel(yr, subject, winner)

-- 1. Display Nobel prizes for 1950.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

-- 2. Show who won the 1962 prize for literature.
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject = 'peace';

-- 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
AND yr BETWEEN 1980 AND 1989;

-- 6. Show all details of the presidential winners: Theodore Roosevelt, Thomas Woodrow Wilson, Jimmy Carter, Barack Obama.
SELECT * FROM nobel
WHERE subject = 'peace'
AND winner IN ('Theodore Roosevelt',
				'Thomas Woodrow Wilson',
				'Jimmy Carter',
				'Barack Obama');

-- 7. Show the winners with first name John.
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

-- 8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner
FROM nobel
WHERE (yr = 1980
	AND subject = 'physics')
	OR (yr = 1984
	AND subject = 'chemistry');

-- 9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
	AND subject NOT IN ('chemistry', 'medicine');

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004).
SELECT yr, subject, winner
FROM nobel
WHERE (yr < 1910
	AND subject = 'medicine')
	OR (yr >= 2004
	AND subject = 'literature');

-- 11. Find all details of the prize won by PETER GRÜNBERG.
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

-- 12. Find all details of the prize won by EUGENE O'NEILL.
SELECT *
FROM nobel
WHERE winner = "EUGENE O'NEILL";

-- 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner;

-- 14. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('physics','chemistry'), subject, winner;

-- Legal SQL for more portability:
-- ORDER BY
-- CASE WHEN subject IN ('physics', 'chemistry') THEN 1 ELSE 0 END, subject, winner;

----------
