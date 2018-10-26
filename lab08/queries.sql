-- SQL queries retrieving data
--
-- Written by: Luke Steffen (lhs3)
-- Date: 10/26/2018

-- a.
SELECT * FROM Game
ORDER BY time;

-- b.
SELECT * FROM Game
WHERE time > '2018-10-19 00:00:00';

-- c.
SELECT * FROM Player
WHERE name is NULL;

-- d.
SELECT playerID FROM PlayerGame
WHERE score > 2000;

-- e.
SELECT * FROM Player
WHERE emailAddress LIKE '%@gmail.com';

-- a.
SELECT name, playerID, score 
FROM PlayerGame JOIN Player
  ON PlayerGame.playerID = Player.ID
WHERE Player.name = 'The King'
ORDER BY score DESC;

-- b.
SELECT name, playerID, score
FROM PlayerGame JOIN Player
  ON Player.ID = PlayerGame.playerID
ORDER BY score DESC
   LIMIT 1;

-- c.
-- This acts as a second condition for the join clause that acts as a way to
-- find the original player name and id for duplicate names in a table. If there
-- are no duplicate names, the query will return empty.

-- d.
-- You can use a self-join to find things like a running count or running total
-- in a table or to match similar things within the same table. It can also be
-- used to remove duplicates from a table.