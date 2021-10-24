#15.5.1.1 Movie Table
CREATE TABLE movies (
movie_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(120),
year_released INT,
director VARCHAR(80)
);

#15.5.1.2 Directors Table
CREATE TABLE directors (
director_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(40),
last_name VARCHAR(40),
country VARCHAR(80)
);

#15.5.1.3 Relating the table
DROP TABLE movies;
drop table directors;

CREATE TABLE movies (
movie_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(120),
year_released INT,
director_id INTEGER,
foreign key (director_id) references directors(director_id)
);

#15.5.2 Assignment task lists
#1 List the title of all movies
SELECT title FROM movies;

#2 List title and year of movie desending order of year
SELECT title, year_released FROM movies ORDER BY year_released DESC;

#3 List all from directors order by country ascending
SELECT * FROM directors ORDER BY country;

#4 List all from directors first country then last name ascending
SELECT * FROM directors ORDER BY country, last_name;

#5 Insert new record
INSERT INTO directors (first_name, last_name, country) VALUES ("Rob", "Reiner", "USA");

#6 List last_name and director_id for Rob
SELECT director_id, last_name FROM directors WHERE first_name = "ROB";

#7 Insert new record into movies
INSERT INTO movies (title, year_released, director_id) VALUES ("The Princess Bride",1987,11);

#8 List movies with director name using inner join
SELECT title, year_released, last_name FROM movies as t1 INNER JOIN directors as t2 ON t1.director_id = t2.director_id;

#9 List all movies with director first and last name. Order by last name
SELECT title, year_released, first_name, last_name FROM movies as t1 INNER JOIN directors as t2 ON t1.director_id = t2.director_id ORDER BY t2.last_name;

#10 List first and last name of the director of The Incredibles using WHERE
SELECT first_name, last_name FROM movies as t1 INNER JOIN directors as t2 WHERE t1.director_id = t2.director_id and t1.title="The Incredibles";

#11 List last name and country for the director of Roma
SELECT last_name, country FROM movies as t1 INNER JOIN directors as t2 ON t1.director_id = t2.director_id and t1.title="Roma";

#12 Delete row from movies table
DELETE FROM movies where movie_id=11;
SELECT * FROM movies;
SELECT * FROM directors;

#13 Try to delete one person from director
DELETE FROM directors WHERE director_id = 3;

#15.5.3 Bonus missions
#1 Use column aliases 
SELECT title as "Movie Title" , year_released as "Year of Release"FROM movies ORDER BY year_released DESC;
SELECT * FROM movies;
#2 List movies directed by Peter Jackson
SELECT title, year_released, last_name FROM movies as t1 INNER JOIN directors as t2 ON t1.director_id = t2.director_id WHERE t2.last_name="Jackson" and t2.first_name="Peter";

#3 Add another column to movies that hold money earned
ALTER TABLE movies ADD earned_money DOUBLE;
UPDATE movies SET earned_money=280000 WHERE movies.movie_id =1;
UPDATE movies SET earned_money=1780000 WHERE movies.movie_id =2;
UPDATE movies SET earned_money=890000 WHERE movies.movie_id =3;
UPDATE movies SET earned_money=8670000 WHERE movies.movie_id =4;
UPDATE movies SET earned_money=80000 WHERE movies.movie_id =5;
UPDATE movies SET earned_money=5340000 WHERE movies.movie_id =6;
UPDATE movies SET earned_money=674567 WHERE movies.movie_id =7;
UPDATE movies SET earned_money=40000 WHERE movies.movie_id =8;
UPDATE movies SET earned_money=6780000 WHERE movies.movie_id =9;
UPDATE movies SET earned_money=1780000 WHERE movies.movie_id =10;
UPDATE movies SET earned_money=830000 WHERE movies.movie_id =11;
UPDATE movies SET earned_money=8120000 WHERE movies.movie_id =12;
UPDATE movies SET earned_money=814000 WHERE movies.movie_id =13;
UPDATE movies SET earned_money=55240000 WHERE movies.movie_id =14;
UPDATE movies SET earned_money=690567 WHERE movies.movie_id =15;
UPDATE movies SET earned_money=3240000 WHERE movies.movie_id =16;
UPDATE movies SET earned_money=3240000;

#Generate a list by ranking based on earnings
SELECT title, year_released, earned_money, RANK() OVER(ORDER BY earned_money DESC) AS "Profit Rank" 
FROM movies  ORDER BY "Profit Rank";
 
SELECT * FROM movies WHERE earned_money > 1000000;

