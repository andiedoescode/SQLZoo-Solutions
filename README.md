# SQLZoo Solutions

This README file shows the solutions to the [SQLZoo Tutorials](https://www.sqlzoo.net/wiki/SQL_Tutorial). It includes all sections, as well as the quizzes.

## Sections

0. [SELECT basics](#0-select-basics)
1. [SELECT name](#1-select-name)
2. [SELECT from World](#2-select-from-world)
3. [SELECT from Nobel](#3-select-from-nobel)
4. [SELECT within SELECT](#4-select-in-select)
5. [SUM and COUNT](#5-sum-and-count)
6. [JOIN](#6-join)
7. [More JOIN](#7-more-join)
8. [Using Null](#8-using-null)
   - 8+. [Numeric Examples](#8-nss-tutorial-numeric-examples)
9. Self join
   - 9-. Window function
   - 9+. COVID 19 Example

## 0. SELECT basics

![World data table](images/world-table.png)

1. Show the population of Germany.

```sql
SELECT population
FROM world
WHERE name = 'Germany';
```

2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

```sql
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

3. Show the country and the area for countries with an area between 200,000 and 250,000.

```sql
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000
```

### SELECT Basics quiz

1. Select the code which produces this table:

![Table: name and population](images/basics-quiz1.png)

```sql
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;
```

2. Pick the result you would obtain from this code:

```sql
SELECT name, population
FROM world
WHERE name LIKE "Al%"
```

![Table-E: name and population](images/basics-quiz2.png)

3. Select the code which shows the countries that end in A or L.

```sql
SELECT name
FROM world
WHERE name LIKE '%a' OR name LIKE '%l';
```

4. Pick the result from the query

```sql
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'
```

![Table: name and name lengths](images/basics-quiz4.png)

5. Pick the result you would obtain from this code:

```sql
SELECT name, area*2
FROM world
WHERE population = 64000
```

![Table: Andora, 936](images/basics-quiz5.png)

6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000.

```sql
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000
```

7. Select the code that shows the population density of China, Australia, Nigeria and France.

```sql
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
```

## 1. SELECT name

1. Find the country that start with Y.

```sql
SELECT name
FROM world
WHERE name LIKE 'Y%';
```

2. Find the countries that end with y.

```sql
SELECT name
FROM world
WHERE name LIKE '%y';
```

3. Find the countries that contain the letter x.

```sql
SELECT name
FROM world
WHERE name LIKE '%x%';
```

4. Find the countries that end with land.

```sql
SELECT name
FROM world
WHERE name LIKE '%land'
```

5. Find the countries that start with C and end with ia.

```sql
SELECT name
FROM world
WHERE name LIKE 'C%ia';
```

6. Find the country that has oo in the name.

```sql
SELECT name
FROM world
WHERE name LIKE '%oo%';
```

7. Find the countries that have three or more a in the name.

```sql
SELECT name
FROM world
WHERE name LIKE '%a%a%a%';
```

8. Find the countries that have "t" as the second character.

```sql
SELECT name
FROM world
WHERE name LIKE '_t%'
ORDER BY name;
```

9. Find the countries that have two "o" characters separated by two others.

```sql
SELECT name
FROM world
WHERE name LIKE '%o__o%';
```

10. Find the countries that have exactly four characters.

```sql
SELECT name
FROM world
WHERE name LIKE '\_\_\_\_';
```

11. Find the country where the name is the capital city.

```sql
SELECT name
FROM world
WHERE name LIKE capital;
```

12. Find the country where the capital is the country plus "City".

```sql
SELECT name
FROM world
WHERE capital LIKE concat(name, ' City');
```

13. Find the capital and the name where the capital includes the name of the country.

```sql
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');
```

14. Find the capital and the name where the capital is an extension of name of the country. But not where the capital is the same as the country.

```sql
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '%')
AND capital != name;
```

15. Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.
    -- The capital of Monaco is Monaco-Ville: this is the name Monaco and the extension is -Ville.

```sql
SELECT name, REPLACE(capital, name, '') AS 'Extension'
FROM world
WHERE capital LIKE CONCAT(name, '\_%');
```

## 2. SELECT from World

1. Show the name, continent and population of all countries.

```sql
SELECT name, continent, population
FROM world;
```

2. Show the name for the countries that have a population of at least 200 million.

```sql
SELECT name
FROM world
WHERE population >= 200000000;
```

3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

```sql
SELECT name, gdp/population 'Per Capita GDP'
FROM world
WHERE population >=200000000;
```

4. Show the name and population in millions for the countries of the continent 'South America'.

```sql
SELECT name, population/1000000 AS 'Population'
FROM world
WHERE continent = 'South America';
```

5. Show the name and population for France, Germany, Italy.

```sql
SELECT  name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
```

6. Show the countries which have a name that includes the word 'United'.

```sql
SELECT name
FROM world
WHERE name LIKE '%united%';
```

7. Show the countries that are big by area or big by population. Show name, population and area.

```sql
SELECT name, population, area
FROM world
WHERE area > 3000000
OR population > 250000000;
```

8. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

```sql
SELECT name, population, area
FROM world
WHERE area > 3000000
XOR population > 250000000;
```

9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.

```sql
SELECT name, ROUND(population/1000000, 2) AS 'Population (millions)', ROUND(GDP/1000000000, 2) AS 'GDP (billions)'
FROM world
WHERE continent = 'South America';
```

10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.

```sql
SELECT name, ROUND(GDP/population, -3) AS 'Per-Capita GDP'
FROM world
WHERE GDP > 1000000000000;
```

11. Show the name and capital where the name and the capital have the same number of characters.

```sql
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
```

12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

```sql
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital,1)
AND name <> capital;
```

13. Find the country that has all the vowels and no spaces in its name.

```sql
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';
```

### SELECT from World BBC Quiz

![Table for BBC Quiz](images/world-quiz-table.png)

1. Select the code which gives the name of countries beginning with U.

```sql
SELECT name
FROM world
WHERE name LIKE 'U%'
```

2. Select the code which shows just the population of United Kingdom.

```sql
SELECT population
FROM world
WHERE name = 'United Kingdom'
```

3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:

```sql
SELECT continent
FROM world
WHERE 'name' = 'France'
```

-- B - 'name' should be name

4. Select the result that would be obtained from the following code:

```sql
SELECT name, population / 10
FROM world
WHERE population < 10000
```

![Table: Nauru, 990](images/world-quiz4.png)

5. Select the code which would reveal the name and population of countries in Europe and Asia.

```sql
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')
```

6. Select the code which would give two rows.

```sql
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')
```

7. Select the result that would be obtained from this code:

```sql
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000
```

![Table: Brazil, Colombia](images/world-quiz7.png)

## 3. SELECT from Nobel

Table of Nobel prize winners: nobel(yr, subject, winner)

1. Display Nobel prizes for 1950.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;
```

2. Show who won the 1962 prize for literature.

```sql
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';
```

3. Show the year and subject that won 'Albert Einstein' his prize.

```sql
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';
```

4. Give the name of the 'peace' winners since the year 2000, including 2000.

```sql
SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject = 'peace';
```

5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'literature'
AND yr BETWEEN 1980 AND 1989;
```

6. Show all details of the presidential winners: Theodore Roosevelt, Thomas Woodrow Wilson, Jimmy Carter, Barack Obama.

```sql
SELECT * FROM nobel
WHERE subject = 'peace'
AND winner IN ('Theodore Roosevelt',
				'Thomas Woodrow Wilson',
				'Jimmy Carter',
				'Barack Obama');
```

7. Show the winners with first name John.

```sql
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';
```

8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE (yr = 1980
	AND subject = 'physics')
	OR (yr = 1984
	AND subject = 'chemistry');
```

9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine.

```sql
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980
	AND subject NOT IN ('chemistry', 'medicine');
```

10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004).

```sql
SELECT yr, subject, winner
FROM nobel
WHERE (yr < 1910
	AND subject = 'medicine')
	OR (yr >= 2004
	AND subject = 'literature');
```

11. Find all details of the prize won by PETER GRÜNBERG.

```sql
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';
```

12. Find all details of the prize won by EUGENE O'NEILL.

```sql
SELECT *
FROM nobel
WHERE winner = "EUGENE O'NEILL";
```

13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

```sql
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr desc, winner;
```

14. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.

```sql
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('physics','chemistry'), subject, winner;
-- Legal SQL for more portability:
-- ORDER BY
-- CASE WHEN subject IN ('physics', 'chemistry') THEN 1 ELSE 0 END, subject, winner;
```

### SELECT from Nobel Quiz

![Table for Nobel quiz](images/nobel-quiz-table.png)

1. Pick the code which shows the name of winner's names beginning with C and ending in n.

```sql
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'
```

2. Select the code that shows how many Chemistry awards were given between 1950 and 1960.

```sql
SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry'
AND yr BETWEEN 1950 and 1960
```

3. Pick the code that shows the amount of years where no Medicine awards were given.

```sql
SELECT COUNT(DISTINCT yr) FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
```

4. Select the result that would be obtained from the following code:

```sql
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
```

![Table: Medicine winners Sir John Eccles and Sir Frank Macfarlane Burnet](images/nobel-quiz4.png)

5. Select the code which would show the year when neither a Physics or Chemistry award was given.

```sql
SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr
				FROM nobel
				WHERE subject IN ('Chemistry','Physics'))
```

6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was.

```sql
SELECT DISTINCT yr
FROM nobel
WHERE subject='Medicine'
AND yr NOT IN(SELECT yr FROM nobel
				WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel
				WHERE subject='Peace')
```

7. Pick the result that would be obtained from the following code:

```sql
SELECT subject, COUNT(subject)
FROM nobel
WHERE yr ='1960'
GROUP BY subject
```

![Table: Count of Chemistry (1), Literature (1), Medicine (2), Peace (1), Physics (1)](images/nobel-quiz7.png)

## 4. SELECT in SELECT

![Table for SELECT in SELECT](images/select-table.png)

1. List each country name where the population is larger than that of 'Russia'.

```sql
SELECT name
FROM world
WHERE population >
	(SELECT population FROM world
	WHERE name='Russia');
```

2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

```sql
SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population
                      FROM world
                      WHERE name = 'United Kingdom');
```

3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

```sql
SELECT name,
		continent
FROM world
WHERE continent IN (SELECT continent
					FROM world
					WHERE name = 'Argentina'
					OR name = 'Australia')
ORDER BY name;
```

4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

```sql
SELECT name,
		population
FROM world
WHERE population > (SELECT population
					FROM world
					WHERE name = 'United Kingdom')
AND population < (SELECT population
				FROM world
				WHERE name = 'Germany');
```

5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

```sql
SELECT name,
		CONCAT(ROUND(population/(SELECT population
								FROM world
								WHERE name = 'Germany')
					*100, 0), '%') AS 'percentage'
FROM world
WHERE continent = 'Europe';
```

6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

```sql
SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp)
			FROM world
			WHERE continent = 'Europe');
```

7. Find the largest country (by area) in each continent, show the continent, the name and the area. Use a correlated/synchronized sub-query.

```sql
SELECT continent, name, area
FROM world AS x
WHERE area >= ALL (SELECT area
					FROM world AS y
					WHERE y.continent = x.continent);
```

8. List each continent and the name of the country that comes first alphabetically.

```sql
SELECT continent, name
FROM world AS x
WHERE name <= ALL (SELECT name
					FROM world AS y
					WHERE x.continent = y.continent);
```

9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

```sql
SELECT name, continent, population
FROM world
WHERE continent NOT IN (SELECT DISTINCT continent
						FROM world
						WHERE population <= 25000000);
```

10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.

```sql
SELECT name, continent
FROM world AS x
WHERE population > ALL(SELECT population * 3
						FROM world AS y
						WHERE x.continent = y.continent
						AND x.name <> y.name);
```

### Nested SELECT Quiz

![Table for Nested SELECT quiz](./images/nested-quiz-table.png)

1. Select the code that shows the name, region and population of the smallest country in each region

```sql
SELECT region, name, population
FROM bbc x
WHERE population <= ALL (SELECT population
						FROM bbc y
						WHERE y.region=x.region
						AND population>0)
```

2. Select the code that shows the countries belonging to regions with all populations over 50000

```sql
SELECT name,region,population
FROM bbc x
WHERE 50000 < ALL (SELECT population
					FROM bbc y
					WHERE x.region=y.region
					AND y.population>0)
```

3. Select the code that shows the countries with a less than a third of the population of the countries around it

```sql
SELECT name, region
FROM bbc x
WHERE population < ALL (SELECT population/3
						FROM bbc y
						WHERE y.region = x.region
						AND y.name != x.name)
```

4. Select the result that would be obtained from the following code:

```sql
SELECT name FROM bbc
WHERE population >
	(SELECT population
		FROM bbc
		WHERE name='United Kingdom')
AND region IN
	(SELECT region
		FROM bbc
		WHERE name = 'United Kingdom')
```

![Table-D: France, Germany, Russia, Turkey](./images/select-quiz4.png)

5. Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).

```sql
SELECT name
FROM bbc
WHERE gdp > (SELECT MAX(gdp)
			FROM bbc
			WHERE region = 'Africa')
```

6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark.

```sql
SELECT name
FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark')
```

7. Select the result that would be obtained from the following code:

```sql
SELECT name FROM bbc
WHERE population > ALL
	(SELECT MAX(population)
	FROM bbc
	WHERE region = 'Europe')
AND region = 'South Asia'
```

![Table-B: Bangladesh, India, Pakistan](images/select-quiz7.png)

## 5. SUM and COUNT

1. Show the total population of the world.

```sql
SELECT SUM(population)
FROM world;
```

2. List all the continents - just once each.

```sql
SELECT DISTINCT continent
FROM world;
```

3. Give the total GDP of Africa.

```sql
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';
```

4. How many countries have an area of at least 1000000.

```sql
SELECT COUNT(area)
FROM world
WHERE area >= 1000000;
```

5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')?

```sql
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia',
				'Latvia',
				'Lithuania');
```

6. For each continent show the continent and number of countries.

```sql
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;
```

7. For each continent show the continent and number of countries with populations of at least 10 million.

```sql
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;
```

8. List the continents that have a total population of at least 100 million.

```sql
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
```

### SUM and COUNT quiz

![Table for SUM and COUNT quiz](images/sumcount-quiz-table.png)

1. Select the statement that shows the sum of population of all countries in 'Europe'.

```sql
SELECT SUM(population) FROM bbc WHERE region = 'Europe'
```

2. Select the statement that shows the number of countries with population smaller than 150000.

```sql
SELECT COUNT(name) FROM bbc WHERE population < 150000
```

3. Select the list of core SQL aggregate functions.

```sql
AVG(), COUNT(), MAX(), MIN(), SUM()
```

4. Select the result that would be obtained from the following code:

```sql
SELECT region, SUM(area)
FROM bbc
WHERE SUM(area) > 15000000
GROUP BY region
-- D - No result due to invalid use of the WHERE function
```

5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'.

```sql
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
```

6. Select the statement that shows the medium population density of each region.

```sql
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
```

7. Select the statement that shows the name and population density of the country with the largest population.

```sql
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
```

8. Pick the result that would be obtained from the following code:

```sql
 SELECT region, SUM(area)
FROM bbc
GROUP BY region
HAVING SUM(area)<= 20000000
```

![Table: Americas (732240), Middle East (13403102), South America (17740392), South Asia (9437710)](images/sumcount-quiz8.png)

## 6. JOIN

![Table for JOIN](images/join-table.png)

1. Show the matchid and player name for all goals scored by Germany. (To identify German players, check for: teamid = 'GER').

```sql
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';
```

2. Show id, stadium, team1, team2 for just game 1012.

```sql
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;
```

3. Show the player, teamid, stadium and mdate for every German goal.

```sql
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE goal.teamid = 'GER';
```

4. Show the team1, team2 and player for every goal scored by a player called Mario.

```sql
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON (game.id = goal.matchid)
WHERE goal.player LIKE 'Mario%';
```

5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes (gtime<=10).

```sql
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON teamid = id
WHERE gtime <= 10;
```

6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

```sql
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos';
```

7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.

```sql
SELECT player
FROM goal
JOIN game on matchid = id
WHERE stadium = 'National Stadium, Warsaw';
```

8. Show the name of all players who scored a goal against Germany.

```sql
SELECT DISTINCT player
FROM game
JOIN goal ON matchid = id
WHERE (game.team1 = 'GER' OR game.team2 = 'GER')
AND (goal.teamid <> 'GER');
```

9. Show teamname and the total number of goals scored.

```sql
SELECT eteam.teamname, COUNT(goal.gtime)
FROM eteam
JOIN goal on eteam.id = goal.teamid
GROUP BY eteam.teamname;
```

10. Show the stadium and the number of goals scored in each stadium.

```sql
SELECT stadium, COUNT(gtime)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY stadium;
```

11. For every match involving 'POL', show the matchid, date and the number of goals scored.

```sql
SELECT goal.matchid, game.mdate, COUNT(goal.gtime)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY goal.matchid;
```

12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.

```sql
SELECT matchid, mdate, COUNT(gtime)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid;
```

13. List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

![Table to show every match and goals by each team](images/join-table13.png)

```sql
SELECT game.mdate,
		game.team1,
		SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS Score1,
		team2,
		SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) 'Score2'
FROM game
LEFT JOIN goal ON game.id = goal.matchid
GROUP BY game.id
ORDER BY mdate, matchid, team1, team2;
```

### JOIN quiz (using same tables as exercises above)

1. You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use.

```sql
game JOIN goal ON (id=matchid)
```

2. You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line.

```sql
matchid, teamid, player, gtime, id, teamname, coach
```

3. Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).

```sql
SELECT player, teamid, COUNT(*)
FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE")
AND teamid != 'GRE'
GROUP BY player, teamid
```

4. Select the result that would be obtained from this code:

```sql
SELECT DISTINCT teamid, mdate
FROM goal JOIN game on (matchid=id)
WHERE mdate = '9 June 2012'
```

![Table: DEN (9 June 2012), GER (9 June 2012)](images/join-quiz4.png)

5. Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.

```sql
SELECT DISTINCT player, teamid
FROM game JOIN goal ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'
```

6. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).

```sql
SELECT DISTINCT player, teamid, gtime
FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))
```

7. Select the result that would be obtained from this code:

```sql
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON teamid = id
GROUP BY teamname
HAVING COUNT(*) < 3
```

![Table: Netherlands (2), Poland (2), Republic of Ireland (1), Ukraine (2)](images/join-quiz7.png)

## 7. More JOIN

![Table for More JOIN](images/morejoin-table.png)

1. List the films where the yr is 1962 [Show id, title].

```sql
SELECT id, title
FROM movie
WHERE yr = 1962;
```

2. Give year of 'Citizen Kane'.

```sql
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';
```

3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

```sql
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
```

4. What id number does the actor 'Glenn Close' have?

```sql
SELECT id
FROM actor
WHERE name = 'Glenn Close';
```

5. What is the id of the film 'Casablanca'?

```sql
SELECT id
FROM movie
WHERE title = 'Casablanca';
```

6. Obtain the cast list for 'Casablanca'.

```sql
SELECT name
FROM actor
	JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = (SELECT id
						FROM movie
						WHERE title = 'Casablanca');
```

7. Obtain the cast list for the film 'Alien'.

```sql
SELECT actor.name
FROM actor, casting, movie
WHERE movie.title = 'Alien'
	AND actor.id = casting.actorid
	AND casting.movieid = movie.id;

--OR

SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid = (SELECT movie.id
                 FROM movie
                 WHERE movie.title = 'Alien');
```

8. List the films in which 'Harrison Ford' has appeared.

```sql
SELECT movie.title
FROM actor
	JOIN casting ON actorid = actor.id
	JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford';
```

9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

```sql
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
```

10. List the films together with the leading star for all 1962 films.

```sql
SELECT movie.title, actor.name
FROM movie, actor, casting
WHERE yr = '1962'
	AND movie.id = casting.movieid
	AND casting.actorid = actor.id
	AND casting.ord = 1;
```

11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

```sql
SELECT yr,COUNT(title)
FROM movie
	JOIN casting ON movie.id=movieid
    JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
```

12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

```sql
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
```

13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

```sql
SELECT actor.name
FROM actor
	JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(actor.name) >= 15;
```

14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

```sql
SELECT movie.title, COUNT(casting.actorid)
FROM movie
    JOIN casting ON casting.movieid = movie.id
WHERE movie.yr = 1978
GROUP BY casting.movieid
ORDER BY COUNT(casting.actorid) desc, movie.title
```

15. List all the people who have worked with 'Art Garfunkel'.

```sql
SELECT DISTINCT actor.name
FROM actor
    JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid IN (SELECT casting.movieid
                         FROM casting
                             JOIN actor ON actor.id = casting.actorid
                         WHERE actor.name = 'Art Garfunkel')
	AND actor.name <> 'Art Garfunkel';
```

### More JOIN Quiz

1. Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget).

```sql
SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget
```

2. Select the correct example of JOINing three tables.

```sql
SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid
```

3. Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted.

```sql
SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC
```

4. Select the result that would be obtained from the following code:

```sql
SELECT title
FROM movie JOIN casting ON (movieid=movie.id)
	JOIN actor ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1
```

![Table-B: "Crocodile" Dundee, Crocodile Dundee in Los Angeles, Flipper, Lightning Jack](images/morejoin-quiz4.png)

5. Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351.

```sql
SELECT name
	FROM movie JOIN casting ON movie.id = movieid
	JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351
```

6. There are two sensible ways to connect movie and actor. They are:

- link the director column in movies with the primary key in actor
- connect the primary keys of movie and actor via the casting table

7. Select the result that would be obtained from the following code:

```sql
SELECT title, yr
	FROM movie, casting, actor
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3
```

![Table-B: A Bronx Tale (1993), Bang the Drum Slowly (1973), Limitless (2011)](images/morejoin-quiz7.png)

## 8. Using Null

![Table for Using Null](images/usingnull-table.png)

Teachers and Departments:
The school includes many departments. Most teachers work exclusively for a single department. Some teachers have no department.

1. List the teachers who have NULL for their department.

```sql
SELECT name
FROM teacher
WHERE dept IS NULL;
```

2. The INNER JOIN misses the teachers with no department and the departments with no teacher.

```sql
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
```

3. Use a different JOIN so that all teachers are listed.

```sql
SELECT teacher.name, dept.name
FROM teacher
	LEFT JOIN dept ON teacher.dept = dept.id;
```

4. Use a different JOIN so that all departments are listed.

```sql
SELECT teacher.name, dept.name
FROM teacher
	RIGHT JOIN dept ON teacher.dept = dept.id;
```

5. Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given.

```sql
SELECT name, COALESCE(mobile, '07986 444 2266') as 'Mobile'
FROM teacher;
```

6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

```sql
SELECT teacher.name, COALESCE(dept.name, 'None') 'Dept'
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;
```

7. Use COUNT to show the number of teachers and the number of mobile phones.

```sql
SELECT COUNT(teacher.name) '# of Teachers', COUNT(teacher.mobile) '# of Mobiles'
FROM teacher;
```

8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

```sql
SELECT dept.name, COUNT(teacher.name) 'Number of Teachers'
FROM teacher
RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name;
```

9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

```sql
SELECT teacher.name,
	CASE WHEN teacher.dept = '1' OR teacher.dept = '2' THEN 'Sci'
	ELSE 'Art'
	END 'Type'
FROM teacher;
```

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

```sql
SELECT teacher.name,
	CASE WHEN teacher.dept = '1' OR teacher.dept = '2' THEN 'Sci'
	WHEN teacher.dept = '3' THEN 'Art'
	ELSE 'None'
	END 'Type'
FROM teacher;
```

### Using Null Quiz

1. Select the code which uses an outer join correctly.

```sql
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)
```

2. Select the correct statement that shows the name of department which employs Cutflower.

```sql
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'
```

3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers.

```sql
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name
```

4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:

`B: display 0 in result column for all teachers without department`

5. This query shows following 'digit':

```sql
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
			WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
FROM teacher
```

`A: 'four' for Throd`

6. Select the result that would be obtained from the following code:

```sql
SELECT name,
	CASE
		WHEN dept
			IN (1)
			THEN 'Computing'
		ELSE 'Other'
	END
FROM teacher
```

![Table-A: Computing (Shrivell, Throd, Split), Other (Spiregrain, Cutflower, Deadyawn)](images/usingnull-quiz6.png)

## 8+. NSS Tutorial (Numeric Examples)

![Table for NSS Tutorial](images/nss_tut.png)

National Student Survey 2012

The National Student Survey http://www.thestudentsurvey.com/ is presented to thousands of graduating students in UK Higher Education. The survey asks 22 questions, students can respond with STRONGLY DISAGREE, DISAGREE, NEUTRAL, AGREE or STRONGLY AGREE. The values in these columns represent PERCENTAGES of the total students who responded with that answer.

The table nss has one row per institution, subject and question.

1. Show the the percentage who STRONGLY AGREE.

```sql
SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
	AND institution='Edinburgh Napier University'
	AND subject='(8) Computer Science';
```

2. Show the institution and subject where the score is at least 100 for question 15.

```sql
SELECT institution, subject
FROM nss
WHERE question='Q15'
	AND score >= 100;
```

3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15'.

```sql
SELECT institution, score
FROM nss
WHERE question='Q15'
	AND subject='(8) Computer Science'
	AND score < 50;
```

4. Show the subject and total number of students who responded to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

```sql
SELECT subject, SUM(response)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
	OR subject = '(H) Creative Arts and Design')
GROUP BY subject;
```

5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'.

```sql
SELECT subject, SUM(A_STRONGLY_AGREE*response/100)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
		OR subject='(H) Creative Arts and Design')
GROUP BY subject;
```

6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.

```sql
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE/100) / SUM(response) * 100)
FROM nss
WHERE question='Q22'
	AND (subject='(8) Computer Science'
		OR subject='(H) Creative Arts and Design')
GROUP BY subject;
```

7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name.

```sql
SELECT institution, ROUND(SUM(response*score) / SUM(response))
FROM nss
WHERE question='Q22'
	AND (institution LIKE '%Manchester%')
GROUP BY institution;
```

8. Show the institution, the total sample size and the number of computing students for institutions in Manchester for 'Q01'.

```sql
SELECT institution, SUM(sample), SUM(CASE WHEN subject='(8) Computer Science' THEN sample END)
FROM nss
WHERE question='Q01'
	AND (institution LIKE '%Manchester%')
GROUP BY institution;
```
