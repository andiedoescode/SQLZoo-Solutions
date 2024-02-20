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