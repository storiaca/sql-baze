CREATE TABLE directors (
director_id int(11) NOT NULL AUTO_INCREMENT,
director_name varchar(500),
constraint pk_director PRIMARY KEY (director_id)
);

CREATE TABLE movies (
movie_id int(11) NOT NULL AUTO_INCREMENT,
director_id int(11) NOT NULL,
title varchar(200),
status varchar(20),
age_rating varchar(5),
runtime_min int,
release_date date,
trailer_link varchar(1000),
description varchar(1000),
banner_text varchar(1000),
header_image varchar(1000),
poster_image varchar(1000),
synopsis_image varchar(4000),
created_at timestamp NOT NULL DEFAULT current_timestamp(),
constraint pk_movie PRIMARY KEY (movie_id),
constraint fk_movie_director FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

CREATE TABLE cast_member (
director_id int(11) NOT NULL AUTO_INCREMENT,
director_name varchar(500),
constraint pk_director PRIMARY KEY (director_id)
);