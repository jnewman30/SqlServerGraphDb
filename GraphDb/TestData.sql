-- Create a graph demo database
CREATE DATABASE graphdemo;
go

USE  graphdemo;
go

-- Create NODE tables
CREATE TABLE Person (
  ID INTEGER PRIMARY KEY, 
  name VARCHAR(100)
) AS NODE;

CREATE TABLE Restaurant (
  ID INTEGER NOT NULL, 
  name VARCHAR(100), 
  city VARCHAR(100)
) AS NODE;

CREATE TABLE City (
  ID INTEGER PRIMARY KEY, 
  name VARCHAR(100), 
  stateName VARCHAR(100)
) AS NODE;

-- Create EDGE tables. 
CREATE TABLE likes (rating INTEGER) AS EDGE;
CREATE TABLE friendOf AS EDGE;
CREATE TABLE livesIn AS EDGE;
CREATE TABLE locatedIn AS EDGE;

-- Insert data into node tables. Inserting into a node table is same as inserting into a regular table
INSERT INTO Person VALUES (1, 'John');
INSERT INTO Person VALUES (2, 'Mary');
INSERT INTO Person VALUES (3, 'Alice');
INSERT INTO Person VALUES (4, 'Jacob');
INSERT INTO Person VALUES (5, 'Julie');
INSERT INTO Person VALUES (6, 'Julia');
INSERT INTO Person VALUES (7, 'Kelley');
INSERT INTO Person VALUES (8, 'Bell');
INSERT INTO Person VALUES (9, 'Sandoval');
INSERT INTO Person VALUES (10, 'Patsy');
INSERT INTO Person VALUES (11, 'Charles');
INSERT INTO Person VALUES (12, 'Harrell');
INSERT INTO Person VALUES (13, 'Vonda');
INSERT INTO Person VALUES (14, 'Alston');
INSERT INTO Person VALUES (15, 'Edith');

INSERT INTO Restaurant VALUES (1,'Taco Dell','Bellevue');
INSERT INTO Restaurant VALUES (2,'Ginger and Spice','Seattle');
INSERT INTO Restaurant VALUES (3,'Noodle Land', 'Redmond');
INSERT INTO Restaurant VALUES (3,'Pizza Hut', 'Springfield');

INSERT INTO City VALUES (1,'Bellevue','WA');
INSERT INTO City VALUES (2,'Seattle','WA');
INSERT INTO City VALUES (3,'Redmond','WA');
INSERT INTO City VALUES (4,'Springfield','MO');

-- Insert into edge table. While inserting into an edge table, 
-- you need to provide the $node_id from $from_id and $to_id columns.
INSERT INTO likes VALUES ((SELECT $node_id FROM Person WHERE id = 1), 
       (SELECT $node_id FROM Restaurant WHERE id = 1),9);
INSERT INTO likes VALUES ((SELECT $node_id FROM Person WHERE id = 2), 
      (SELECT $node_id FROM Restaurant WHERE id = 2),9);
INSERT INTO likes VALUES ((SELECT $node_id FROM Person WHERE id = 3), 
      (SELECT $node_id FROM Restaurant WHERE id = 3),9);
INSERT INTO likes VALUES ((SELECT $node_id FROM Person WHERE id = 4), 
      (SELECT $node_id FROM Restaurant WHERE id = 3),9);
INSERT INTO likes VALUES ((SELECT $node_id FROM Person WHERE id = 5), 
      (SELECT $node_id FROM Restaurant WHERE id = 3),9);

INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 1),
      (SELECT $node_id FROM City WHERE id = 1));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 2),
      (SELECT $node_id FROM City WHERE id = 2));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 3),
      (SELECT $node_id FROM City WHERE id = 3));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 4),
      (SELECT $node_id FROM City WHERE id = 3));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 5),
      (SELECT $node_id FROM City WHERE id = 1));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 6),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 7),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 8),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 9),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 10),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 11),
      (SELECT $node_id FROM City WHERE id = 1));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 12),
      (SELECT $node_id FROM City WHERE id = 2));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 13),
      (SELECT $node_id FROM City WHERE id = 3));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 14),
      (SELECT $node_id FROM City WHERE id = 4));
INSERT INTO livesIn VALUES ((SELECT $node_id FROM Person WHERE id = 15),
      (SELECT $node_id FROM City WHERE id = 5));

INSERT INTO locatedIn VALUES ((SELECT $node_id FROM Restaurant WHERE id = 1),
      (SELECT $node_id FROM City WHERE id =1));
INSERT INTO locatedIn VALUES ((SELECT $node_id FROM Restaurant WHERE id = 2),
      (SELECT $node_id FROM City WHERE id =2));
INSERT INTO locatedIn VALUES ((SELECT $node_id FROM Restaurant WHERE id = 3),
      (SELECT $node_id FROM City WHERE id =3));

-- Insert data into the friendof edge.
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 1), (SELECT $NODE_ID FROM person WHERE ID = 2));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 2), (SELECT $NODE_ID FROM person WHERE ID = 3));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 3), (SELECT $NODE_ID FROM person WHERE ID = 1));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 4), (SELECT $NODE_ID FROM person WHERE ID = 2));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 5), (SELECT $NODE_ID FROM person WHERE ID = 4));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 6), (SELECT $NODE_ID FROM person WHERE ID = 10));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 7), (SELECT $NODE_ID FROM person WHERE ID = 9));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 8), (SELECT $NODE_ID FROM person WHERE ID = 8));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 9), (SELECT $NODE_ID FROM person WHERE ID = 7));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 10), (SELECT $NODE_ID FROM person WHERE ID = 6));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 6), (SELECT $NODE_ID FROM person WHERE ID = 11));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 7), (SELECT $NODE_ID FROM person WHERE ID = 11));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 8), (SELECT $NODE_ID FROM person WHERE ID = 11));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 9), (SELECT $NODE_ID FROM person WHERE ID = 11));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 10), (SELECT $NODE_ID FROM person WHERE ID = 11));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 11), (SELECT $NODE_ID FROM person WHERE ID = 2));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 12), (SELECT $NODE_ID FROM person WHERE ID = 3));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 13), (SELECT $NODE_ID FROM person WHERE ID = 1));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 14), (SELECT $NODE_ID FROM person WHERE ID = 2));
INSERT INTO friendof VALUES ((SELECT $NODE_ID FROM person WHERE ID = 15), (SELECT $NODE_ID FROM person WHERE ID = 4));


-- Find Restaurants that John likes
SELECT Restaurant.name
FROM Person, likes, Restaurant
WHERE MATCH (Person-(likes)->Restaurant)
AND Person.name = 'John';

-- Find Restaurants that John's friends like
SELECT Restaurant.name 
FROM Person person1, Person person2, likes, friendOf, Restaurant
WHERE MATCH(person1-(friendOf)->person2-(likes)->Restaurant)
AND person1.name='John';

-- Find people who like a restaurant in the same city they live in
SELECT Person.name
FROM Person, likes, Restaurant, livesIn, City, locatedIn
WHERE MATCH (Person-(likes)->Restaurant-(locatedIn)->City AND Person-(livesIn)->City);