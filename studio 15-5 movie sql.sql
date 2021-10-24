#15.5.1.1. Movies Table
CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director VARCHAR(80)
);

#15.5.1.2. Directors Table
CREATE TABLE directors (
   director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(40),
   last_name VARCHAR(40),
   country VARCHAR(80)
);

#15.5.1.3 Relating tables
DROP TABLE movies;
CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released INTEGER,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

