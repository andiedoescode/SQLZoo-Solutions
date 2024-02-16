# SQLZoo Solutions

Solutions to the [SQLZoo Tutorials](https://www.sqlzoo.net/wiki/SQL_Tutorial).

## Sections

0. [SELECT basics](#0-select-basics)
1. SELECT name
2. SELECT from World
3. SELECT from Nobel
4. SELECT within SELECT
5. SUM and COUNT
6. JOIN
7. More JOIN
8. Using Null
   - 8+. Numeric Examples
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