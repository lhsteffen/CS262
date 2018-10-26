 -- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Properties;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location integer CONSTRAINT player_check CHECK (1 <= location AND location <= 40)
	);

CREATE TABLE Properties (
	propertyID integer CONSTRAINT location_check CHECK (1 <= propertyID AND propertyID <= 40),
	gameID integer REFERENCES Game(ID),
	owner integer REFERENCES Player(ID),
	houses integer,
	hotels boolean
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Properties TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 0.00, 10);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 0.00, 12);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 235, 30);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 100, 25);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 0.00, 20);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 50, 40);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 0, 31);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 550, 3);

INSERT INTO Properties VALUES (2, 1, 3, 3, FALSE);
INSERT INTO Properties VALUES (5, 2, 3, 0, TRUE);
INSERT INTO Properties VALUES (30, 1, 2, 4, FALSE);
INSERT INTO Properties VALUES (36, 3, 1, 2, FALSE);
INSERT INTO Properties VALUES (25, 2, 1, 4, FALSE);
INSERT INTO Properties VALUES (20, 3, 2, 0, TRUE);
INSERT INTO Properties VALUES (27, 1, 3, 0, TRUE);
