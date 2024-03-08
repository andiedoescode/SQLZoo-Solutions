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

-- SELECT from Nobel Quiz
-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n.
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960.
SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given.
SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
-- B - Medicine, Sir John Eccles and Medicine, Sir Frank Macfarlane Burnet

-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given.
SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr 
				FROM nobel
				WHERE subject IN ('Chemistry','Physics'))

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was.
SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine' 
AND yr NOT IN(SELECT yr FROM nobel 
				WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel
				WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
SELECT subject, COUNT(subject) 
FROM nobel 
WHERE yr ='1960' 
GROUP BY subject
-- C - Chemistry (1), Literature (1), Medicine (2), Peace (1), Physics (1)

----------

-- 4. SELECT in SELECT

-- world(name, continent, area, population, gdp)

-- 1. List each country name where the population is larger than that of 'Russia'.
SELECT name
FROM world
WHERE population >
	(SELECT population FROM world
	WHERE name='Russia');

-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population
                      FROM world
                      WHERE name = 'United Kingdom');

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name,
		continent
FROM world
WHERE continent IN (SELECT continent
					FROM world
					WHERE name = 'Argentina'
					OR name = 'Australia')
ORDER BY name;

-- 4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
SELECT name,
		population
FROM world
WHERE population > (SELECT population
					FROM world
					WHERE name = 'United Kingdom')
AND population < (SELECT population
				FROM world
				WHERE name = 'Germany');

-- 5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
SELECT name,
		CONCAT(ROUND(population/(SELECT population
								FROM world
								WHERE name = 'Germany')
					*100, 0), '%') AS 'percentage'
FROM world
WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
			FROM world
			WHERE continent = 'Europe');

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area. Use a correlated/synchronized sub-query.
SELECT continent, name, area
FROM world AS x
WHERE area >= ALL (SELECT area
					FROM world AS y
					WHERE y.continent = x.continent);

-- Alt solution:
-- SELECT continent, name, area
-- FROM world
-- WHERE area IN (SELECT MAX(area) 
--                FROM world 
--                GROUP BY continent);

-- 8. List each continent and the name of the country that comes first alphabetically.
SELECT continent, name
FROM world AS x
WHERE name <= ALL (SELECT name
					FROM world AS y
					WHERE x.continent = y.continent);

-- Alt solution:
-- SELECT continent, name
-- FROM world
-- WHERE name IN (SELECT MIN(name) 
--                FROM world 
--                GROUP BY continent);

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population
FROM world
WHERE continent NOT IN (SELECT DISTINCT continent
						FROM world
						WHERE population <= 25000000);

-- Alt solution:
-- SELECT name, continent, population
-- FROM world AS x
-- WHERE 25000000 >= ALL (SELECT population
-- 						FROM world AS y
-- 						WHERE x.continent = y.continent
-- 						AND population IS NOT NULL);

-- 10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
FROM world AS x
WHERE population > ALL(SELECT population * 3
						FROM world AS y
						WHERE x.continent = y.continent
						AND x.name <> y.name);

-- Nested SELECT Quiz
-- 1. Select the code that shows the name, region and population of the smallest country in each region
SELECT region, name, population
FROM bbc x
WHERE population <= ALL (SELECT population
						FROM bbc y
						WHERE y.region=x.region
						AND population>0)

-- 2. Select the code that shows the countries belonging to regions with all populations over 50000
SELECT name,region,population
FROM bbc x
WHERE 50000 < ALL (SELECT population
					FROM bbc y
					WHERE x.region=y.region
					AND y.population>0)

-- 3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region
FROM bbc x
WHERE population < ALL (SELECT population/3
						FROM bbc y
						WHERE y.region = x.region
						AND y.name != x.name)
-- 4. Select the result that would be obtained from the following code:
SELECT name FROM bbc
WHERE population >
	(SELECT population
		FROM bbc
		WHERE name='United Kingdom')
AND region IN
	(SELECT region
		FROM bbc
		WHERE name = 'United Kingdom')
-- Table-D - France, Germany, Russia, Turkey

-- 5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name
FROM bbc
WHERE gdp > (SELECT MAX(gdp)
			FROM bbc
			WHERE region = 'Africa')

-- 6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark.
SELECT name
FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark')

-- 7. Select the result that would be obtained from the following code:
SELECT name FROM bbc
WHERE population > ALL
	(SELECT MAX(population)
	FROM bbc
	WHERE region = 'Europe')
AND region = 'South Asia'
-- Table-B - Bangladesh, India, Pakistan

----------

-- 5. SUM and COUNT

-- 1. Show the total population of the world.
SELECT SUM(population)
FROM world;

-- 2. List all the continents - just once each.
SELECT DISTINCT continent
FROM world;

-- 3. Give the total GDP of Africa.
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4. How many countries have an area of at least 1000000.
SELECT COUNT(area)
FROM world
WHERE area >= 1000000;

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')?
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia',
				'Latvia',
				'Lithuania');

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

-- SUM and COUNT quiz
-- 1. Select the statement that shows the sum of population of all countries in 'Europe'.
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- 2. Select the statement that shows the number of countries with population smaller than 150000.
SELECT COUNT(name) FROM bbc WHERE population < 150000

-- 3. Select the list of core SQL aggregate functions.
-- AVG(), COUNT(), MAX(), MIN(), SUM()

-- 4. Select the result that would be obtained from the following code:
SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region
-- D - No result due to invalid use of the WHERE function

-- 5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'.
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- 6. Select the statement that shows the medium population density of each region.
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- 7. Select the statement that shows the name and population density of the country with the largest population.
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- 8. Pick the result that would be obtained from the following code:
 SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000
-- Table-D - Americas (732240), Middle East (13403102), South America (17740392), South Asia (9437710)

----------

-- 6. JOIN

-- 1. Show the matchid and player name for all goals scored by Germany. (To identify German players, check for: teamid = 'GER').
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012.
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

-- 3. Show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE goal.teamid = 'GER';

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario.
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE goal.player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes (gtime<=10).
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON teamid = id
WHERE gtime <= 10;

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
SELECT player 
FROM goal
JOIN game on matchid = id
WHERE stadium = 'National Stadium, Warsaw';

-- 8. Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM game
JOIN goal ON matchid = id 
WHERE (game.team1 = 'GER' OR game.team2 = 'GER')
AND (goal.teamid <> 'GER');

-- 9. Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(goal.gtime)
FROM eteam
JOIN goal on eteam.id = goal.teamid
GROUP BY eteam.teamname;

-- 10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(gtime)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT goal.matchid, game.mdate, COUNT(goal.gtime)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY goal.matchid;

-- 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
SELECT matchid, mdate, COUNT(gtime)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid;

-- 13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

-- mdate			team1	score1	team2	score2
-- 1 July 2012		ESP		4		ITA		0
-- 10 June 2012		ESP		1		ITA		1
-- 10 June 2012		IRL		1		CRO		3

SELECT game.mdate,
		game.team1,
		SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS Score1,
		team2,
		SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) 'Score2'
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY game.id
ORDER BY mdate, matchid, team1, team2;

-- JOIN quiz (using same tables as exercises)
-- 1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use.
-- game JOIN goal ON (id=matchid)

-- 2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line.
matchid, teamid, player, gtime, id, teamname, coach

-- 3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE")
AND teamid != 'GRE'
GROUP BY player, teamid

-- 4. Select the result that would be obtained from this code:
SELECT DISTINCT teamid, mdate
FROM goal JOIN game on (matchid=id)
WHERE mdate = '9 June 2012'
-- A - DEN (9 June 2012), GER (9 June 2012)

-- 5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

-- 6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7. Select the result that would be obtained from this code:
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid = id
GROUP BY teamname
HAVING COUNT(*) < 3
-- B - Netherlands (2), Poland (2), Republic of Ireland (1), Ukraine (2)

----------

-- 7. More JOIN

-- 1. List the films where the yr is 1962 [Show id, title].
SELECT id, title
FROM movie
WHERE yr = 1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name = 'Glenn Close';

-- 5. What is the id of the film 'Casablanca'?
SELECT id
FROM movie
WHERE title = 'Casablanca';

-- 6. Obtain the cast list for 'Casablanca'.
SELECT name
FROM actor
	JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = (SELECT id
						FROM movie
						WHERE title = 'Casablanca');

-- 7. Obtain the cast list for the film 'Alien'.
SELECT actor.name
FROM actor, casting, movie
WHERE movie.title = 'Alien'
	AND actor.id = casting.actorid
	AND casting.movieid = movie.id;

-- OR

SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = (SELECT movie.id 
                 FROM movie 
                 WHERE movie.title = 'Alien');

-- 8. List the films in which 'Harrison Ford' has appeared.
SELECT movie.title
FROM actor
	JOIN casting ON actorid = actor.id
	JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford';

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT movie.title
FROM actor, movie, casting
WHERE actor.name = 'Harrison Ford'
	AND actor.id = casting.actorid
	AND casting.movieid = movie.id
	AND casting.ord <> 1

-- OR

SELECT movie.title
FROM movie
	JOIN casting ON casting.movieid = movie.id
	JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
	AND casting.ord <> 1;

-- 10. List the films together with the leading star for all 1962 films.
SELECT movie.title, actor.name
FROM movie, actor, casting
WHERE yr = '1962'
	AND movie.id = casting.movieid
	AND casting.actorid = actor.id
	AND casting.ord = 1;

-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title)
FROM movie
	JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT movie.title, actor.name
FROM movie, casting, actor
WHERE movie.id IN (SELECT movie.id
                    FROM movie, casting, actor
                    WHERE movie.id = casting.movieid
                    AND casting.actorid = actor.id
                    AND actor.name = 'Julie Andrews')
	AND casting.movieid = movie.id
	AND casting.actorid = actor.id
	AND casting.ord = 1;

-- OR

SELECT movie.title, actor.name
FROM movie
    JOIN casting ON casting.movieid = movie.id
    JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN (SELECT movie.id
                    FROM movie, casting, actor
                    WHERE movie.id = casting.movieid
                    AND casting.actorid = actor.id
                    AND actor.name = 'Julie Andrews')
	AND casting.ord = 1;

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name
FROM actor
	JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 15;

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT movie.title, COUNT(casting.actorid)
FROM movie
    JOIN casting ON casting.movieid = movie.id
WHERE movie.yr = 1978
GROUP BY casting.movieid
ORDER BY COUNT(casting.actorid) desc, movie.title

-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT actor.name
FROM actor
    JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid IN (SELECT casting.movieid
                         FROM casting
                             JOIN actor ON actor.id = casting.actorid
                         WHERE actor.name = 'Art Garfunkel')
	AND actor.name <> 'Art Garfunkel';

-- More JOIN Quiz

-- 1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget).
SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget

-- 2. Select the correct example of JOINing three tables.
SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid

-- 3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted.
SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC

-- 4. Select the result that would be obtained from the following code:
SELECT title 
FROM movie JOIN casting ON (movieid=movie.id)
	JOIN actor ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1

-- Table-B: "Crocodile" Dundee, Crocodile Dundee in Los Angeles, Flipper, Lightning Jack

-- 5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351.
SELECT name
	FROM movie JOIN casting ON movie.id = movieid
	JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6. There are two sensible ways to connect movie and actor. They are:
-- - link the director column in movies with the primary key in actor
-- - connect the primary keys of movie and actor via the casting table

-- 7. Select the result that would be obtained from the following code:
SELECT title, yr 
	FROM movie, casting, actor 
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3

-- Table-B: A Bronx Tale (1993), Bang the Drum Slowly (1973), Limitless (2011)

----------

-- 8. Using Null

-- Teachers and Departments:
-- The school includes many departments. Most teachers work exclusively for a single department. Some teachers have no department.

-- 1. List the teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2. The INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3. Use a different JOIN so that all teachers are listed.
SELECT teacher.name, dept.name
FROM teacher
	LEFT JOIN dept ON teacher.dept = dept.id;

-- 4. Use a different JOIN so that all departments are listed.
SELECT teacher.name, dept.name
FROM teacher
	RIGHT JOIN dept ON teacher.dept = dept.id;

-- 5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given.
SELECT name, COALESCE(mobile, '07986 444 2266') as 'Mobile'
FROM teacher;

-- 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
SELECT teacher.name, COALESCE(dept.name, 'None') 'Dept'
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

-- 7. Use COUNT to show the number of teachers and the number of mobile phones.
SELECT COUNT(teacher.name) '# of Teachers', COUNT(teacher.mobile) '# of Mobiles'
FROM teacher;

-- 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
SELECT dept.name, COUNT(teacher.name) 'Number of Teachers'
FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT teacher.name,
	CASE WHEN teacher.dept = '1' OR teacher.dept = '2' THEN 'Sci'
	ELSE 'Art'
	END 'Type'
FROM teacher;

-- 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
SELECT teacher.name,
	CASE WHEN teacher.dept = '1' OR teacher.dept = '2' THEN 'Sci'
	WHEN teacher.dept = '3' THEN 'Art'
	ELSE 'None'
	END 'Type'
FROM teacher;

-- Using Null Quiz
-- 1. Select the code which uses an outer join correctly.
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- 2. Select the correct statement that shows the name of department which employs Cutflower.
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

-- 3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers.
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- 4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
-- B: display 0 in result column for all teachers without department

-- 5. This query shows following 'digit':
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
			WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
FROM teacher
-- A: 'four' for Throd

-- 6. Select the result that would be obtained from the following code:
SELECT name, 
	CASE 
		WHEN dept 
			IN (1) 
			THEN 'Computing' 
		ELSE 'Other' 
	END 
FROM teacher
-- Table-A: Computing (Shrivell, Throd, Split), Other (Spiregrain, Cutflower, Deadyawn)

----------

-- 8+. NSS Tutorial (Numeric Examples)

-- National Student Survey 2012

-- The National Student Survey http://www.thestudentsurvey.com/ is presented to thousands of graduating students in UK Higher Education. The survey asks 22 questions, students can respond with STRONGLY DISAGREE, DISAGREE, NEUTRAL, AGREE or STRONGLY AGREE. The values in these columns represent PERCENTAGES of the total students who responded with that answer.

-- The table nss has one row per institution, subject and question.

-- 1. Show the the percentage who STRONGLY AGREE.
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
	AND institution='Edinburgh Napier University'
	AND subject='(8) Computer Science';

-- 2. Show the institution and subject where the score is at least 100 for question 15.
SELECT institution, subject
FROM nss
WHERE question='Q15'
	AND score >= 100;

-- 3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'.
SELECT institution, score
FROM nss
WHERE question='Q15'
	AND subject='(8) Computer Science'
	AND score < 50;

-- 4. Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
	OR subject = '(H) Creative Arts and Design')
GROUP BY subject;

-- 5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject, SUM(A_STRONGLY_AGREE*response/100)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
		OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100) / SUM(response) * 100)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
		OR subject='(H) Creative Arts and Design')
GROUP BY subject;

-- 7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.
SELECT institution, ROUND(SUM(response*score) / SUM(response))
FROM nss
WHERE question='Q22'
	AND (institution LIKE '%Manchester%')
GROUP BY institution;

-- 8. Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.
SELECT institution, SUM(sample), SUM(CASE WHEN subject='(8) Computer Science' THEN sample END)
FROM nss
WHERE question='Q01'
	AND (institution LIKE '%Manchester%')
GROUP BY institution;

----------

-- 9. Self JOIN

Edinburgh Buses
This database consists of two tables: stops and routes
stops(id, name):
-This is a list of areas served by buses. The detail does not really include each actual bus stop - just areas within Edinburgh and whole towns near Edinburgh.
route(num, company, pos, stop):
-A route is the path through town taken by a bus. As different companies use numbers arbitrarily the num and the company are both required to identify a route.

-- 1. How many stops are in the database.
SELECT COUNT(id)
FROM stops;

-- 2. Find the id value for the stop 'Craiglockhart'.
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

-- 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT s.id, s.name
FROM stops s
	JOIN route r ON r.stop = s.id
WHERE r.num = '4'
	AND r.company = 'LRT';

-- 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
	(a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

-- 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
	(a.company=b.company AND a.num=b.num)
	JOIN stops stopa ON (a.stop=stopa.id)
	JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

-- 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
	(a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;

-- OR

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
	(a.company = b.company AND a.num = b.num)
	JOIN stops stopa ON (a.stop = stopa.id)
	JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name='Haymarket' and stopb.name='Leith';

-- 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'.
SELECT a.company, a.num
FROM route a JOIN route b ON
	(a.company = b.company AND a.num = b.num)
	JOIN stops stopa ON (a.stop = stopa.id)
	JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- 9. Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
	(a.company = b.company AND a.num = b.num)
	JOIN stops stopa ON (a.stop = stopa.id)
	JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart'
	AND a.company = 'LRT'

-- 10. Find the routes involving two buses that can go from Craiglockhart to Lochend. Show the bus no. and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.
SELECT a.num, a.company, stopb.name, c.num, c.company
FROM route a JOIN route b ON
	(a.company = b.company AND a.num = b.num)
	JOIN (route c JOIN route d ON
		(c.company = d.company AND c.num = d.num))
	JOIN stops stopa ON (stopa.id = a.stop)
	JOIN stops stopb ON (stopb.id = b.stop)
	JOIN stops stopc ON (stopc.id = c.stop)
	JOIN stops stopd ON (stopd.id = d.stop)
WHERE stopa.name = 'Craiglockhart'
	AND stopd.name = 'Lochend'
	AND stopb.name = stopc.name
ORDER BY a.num, a.company, stopb.name, c.num, c.company;

-- Self JOIN Quiz
-- 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket.
SELECT DISTINCT a.name, b.name
FROM stops a JOIN route z ON a.id=z.stop
	JOIN route y ON y.num = z.num	
	JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Haymarket' AND S1.id=R1.stop
	AND R1.company=R2.company AND R1.num=R2.num
	AND R2.stop=S2.id AND R2.num='2A'

-- 3. Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
	JOIN stops stopa ON (a.stop=stopa.id)
	JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross'


----------

-- 9-. Window functions

-- General Elections were held in the UK in 2015 and 2017. Every citizen votes in a constituency. The candidate who gains the most votes becomes MP for that constituency.

-- All these results are recorded in a table ge

-- 1. Show the lastName, party and votes for the constituency 'S14000024' in 2017.
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;

-- 2. Show the party and RANK for constituency S14000024 in 2017. List the output by party. (You can use the RANK function to see the order of the candidates.)
SELECT party, votes,
	RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party;

-- 3. Use PARTITION to show the ranking of each party in S14000021 in each year. Include yr, party, votes and ranking (the party with the most votes is 1).
SELECT yr, party, votes,
	RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr;

-- 4. Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017. Order your results so the winners are shown first, then ordered by constituency.
SELECT constituency, party, votes,
	RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
	AND yr  = 2017
ORDER BY posn, constituency;

-- 5. Show the parties that won for each Edinburgh constituency in 2017.
SELECT constituency, party
FROM (SELECT constituency, party, votes,
			RANK() OVER (PARTITION BY constituency ORDER BY votes desc) AS rank
		FROM ge
		WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
			AND yr = 2017
		ORDER BY constituency, votes DESC) AS results
WHERE rank = 1

-- 6. Show how many seats for each party in Scotland in 2017.
SELECT party, COUNT(*) AS 'Seats'
FROM (SELECT constituency, party, votes,
	RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS ranking
	FROM ge
	WHERE constituency LIKE 'S%'
	AND yr  = 2017) AS results
WHERE ranking = 1
GROUP BY party

----------

-- 9+. COVID 19 (Window LAG)

-- 1. Modify the query to show data from Spain.
SELECT name,
	DAY(whn),
 	confirmed,
	deaths,
	recovered
FROM covid
WHERE name = 'Spain'
	AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- 2. The LAG function is used to show data from the preceding row or the table. When lining up rows the data is partitioned by country name and ordered by the data whn. That means that only data from Italy is considered. Modify the query to show confirmed for the day before.
SELECT name,
	DAY(whn),
	confirmed,
	LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
FROM covid
WHERE name = 'Italy'
	AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- 3. The number of confirmed case is cumulative - but we can use LAG to recover the number of new cases reported for each day. Show the number of new cases for each day, for Italy, for March.
SELECT name,
	DAY(whn),
	confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS 'new'
FROM covid
WHERE name = 'Italy'
	AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- 4. Show the number of new cases in Italy for each week in 2020 - show Monday only.
SELECT name, 
	DATE_FORMAT(whn,'%Y-%m-%d'), 
	confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS 'new this week'
FROM covid
WHERE name = 'Italy'
	AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn;

-- 5. You can JOIN a table using DATE arithmetic. This will give different results if data is missing. Show the number of new cases in Italy for each week - show Monday only.
SELECT tw.name, 
	DATE_FORMAT(tw.whn,'%Y-%m-%d'), 
	tw.confirmed - lw.confirmed
FROM covid tw
	LEFT JOIN covid lw ON DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn AND tw.name=lw.name
WHERE tw.name = 'Italy'
	AND WEEKDAY(tw.whn) = 0
ORDER BY tw.whn;

-- 6. Add a column to show the ranking for the number of deaths due to COVID.
SELECT name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) rd
FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC;

-- 7. Show the infection rate ranking for each country. Only include countries with a population of at least 10 million.
SELECT world.name,
	ROUND(100000*confirmed/population,2),
	RANK() OVER(ORDER BY 100000*confirmed/population) --Don't use ROUND to prevent rank ties
FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC

-- 8. For each country that has had at last 1000 new cases in a single day, show the date of the peak number of new cases.
SELECT result.name,
	DATE_FORMAT(result.whn,'%Y-%m-%d'),
	result.peakNewCases 
FROM (SELECT ranked.name,
			ranked.whn,
			RANK() OVER(PARTITION BY name ORDER BY peakNewCases DESC) AS rk,
			ranked.peakNewCases 
        FROM (SELECT name,
                     whn,
                     (confirmed - LAG(confirmed, 1) OVER(PARTITION BY name ORDER BY whn)) AS peakNewCases
			  FROM covid
			) AS ranked
	) AS result
WHERE result.rk = 1 
	AND result.peakNewCases >= 1000
ORDER BY result.whn;

-- Note: I couldn't get the database to respond properly. "ERROR: Lost connection to MySQL server during query."

