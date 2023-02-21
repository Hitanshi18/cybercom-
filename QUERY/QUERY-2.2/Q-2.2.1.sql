USE Student_db;


CREATE TABLE player_activity (
  player_id INT,
  event_date DATE,
  games_played INT,
  device_id INT,
  PRIMARY KEY (player_id, event_date)
);

INSERT INTO player_activity
VALUES(1, '2016-03-01', 5, 2);

INSERT INTO player_activity
VALUES(1, '2016-05-02', 6, 2);

INSERT INTO player_activity
VALUES(2, '2017-06-25', 1, 3);

INSERT INTO player_activity
VALUES(3, '2016-03-02', 0, 1);

INSERT INTO player_activity
VALUES(3, '2018-07-03', 5, 4);

-- Question 1: Write an SQL query to report the first login date
-- for each player. Return the result table in any order


-- SELECT player_id, MIN(event_date) AS first_login_date
-- FROM player_activity
-- GROUP BY player_id;


-- Question 2: Write an SQL query to report the device that is
-- first logged in for each player. Return the result table in any
-- order.


SELECT player_id, MIN(device_id) AS  device_id
FROM player_activity
GROUP BY player_id having min(event_date);


-- Question 3: Write an SQL query to report for each player and
-- date, how many games played so far by the player. That is, the
-- total number of games played by the player until that date.
-- Check the example for clarity. Return the result table in any
-- order

-- SELECT player_id, event_date, SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS total_games_played
-- FROM player_activity;
