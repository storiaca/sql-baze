CREATE TABLE directors (
director_id int(11) NOT NULL AUTO_INCREMENT,
director_name varchar(500),
created_at timestamp NOT NULL DEFAULT current_timestamp(),
CONSTRAINT pk_directors PRIMARY KEY (director_id)
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
CONSTRAINT pk_movies PRIMARY KEY (movie_id),
CONSTRAINT fk_movie_director FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

CREATE TABLE cast_member (
cast_id int(11) NOT NULL AUTO_INCREMENT,
cast_name varchar(500),
created_at timestamp NOT NULL DEFAULT current_timestamp(),
CONSTRAINT pk_cast PRIMARY KEY (cast_id)
);

CREATE TABLE movie_cast (
movie_id int(11) NOT NULL,
cast_id int(11) NOT NULL,
created_at timestamp NOT NULL DEFAULT current_timestamp(),
CONSTRAINT fk_mc_movies FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
CONSTRAINT fk_mc_cast FOREIGN KEY (cast_id) REFERENCES cast_member(cast_id)
);

CREATE TABLE genres (
genre_id int(11) NOT NULL AUTO_INCREMENT,
genre_name varchar(500),
created_at timestamp NOT NULL DEFAULT current_timestamp(),
CONSTRAINT pk_genres PRIMARY KEY (genre_id)
);

CREATE TABLE movie_genre (
movie_id int(11) NOT NULL,
genre_id int(11) NOT NULL,
created_at timestamp NOT NULL DEFAULT current_timestamp(),
CONSTRAINT fk_mg_movies FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
