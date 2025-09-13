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
    CONSTRAINT fk_movie_director FOREIGN KEY (director_id) REFERENCES directors (director_id)
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
    CONSTRAINT fk_mc_movies FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    CONSTRAINT fk_mc_cast FOREIGN KEY (cast_id) REFERENCES cast_member (cast_id)
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
    CONSTRAINT fk_mg_movies FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
    CONSTRAINT fk_mg_genre FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

INSERT INTO
    directors (director_id, director_name)
VALUES
    (1, 'Kelsey Mann');

INSERT INTO
    genres (genre_id, genre_name)
VALUES
    (1, 'Adventure'),
    (2, 'Animation'),
    (3, 'Comedy'),
    (4, 'Drama'),
    (5, 'Family'),
    (6, 'Fantasy');

INSERT INTO
    cast_member (cast_id, cast_name)
VALUES
    (1, 'Amy Poehler');

INSERT INTO
    movies (
        movie_id,
        director_id,
        title,
        status,
        age_rating,
        runtime_min,
        release_date,
        trailer_link,
        description,
        banner_text,
        header_image,
        poster_image,
        synopsis
    )
VALUES
    (
        1,
        1,
        'Inside Out 2',
        'Tickets On Sale',
        'CTC',
        105,
        '20240613',
        'https://www.youtube.com/watch?v=CkLiND6qa34',
        'In "Inside Out 2," Disney and Pixar dive back into Riley"s mind, now a teen, as it faces unexpected changes: new Emotions!',
        'Dive into Riley"s mind and discover new emotions! Secure your seats for a wild ride through the teen years with Joy, Sadness, Anger, Fear.',
        'https://www.hoyts.com.au/images/banner103.png',
        'https://www.hoyts.com.au/images/poster2931.png',
        'In "Inside Out 2," Disney and Pixar dive back into Riley"s mind, now a teen, as it faces unexpected changes: new Emotions! With Joy, Sadness, Anger, Fear, and Disgust unsure how to handle the arrival of Anxiety and others, voiced by Maya Hawke. Amy Poehler returns as Joy, joined by a stellar cast including Lewis Black and Diane Lane. Directed by Kelsey Mann, produced by Mark Nielsen, and featuring a screenplay by Meg LeFauve and Dave Holstein, "Inside Out 2" promises a captivating journey with a score by Andrea Datzman.'
    );

INSERT INTO
    movie_cast (movie_id, cast_id)
VALUES
    (1, 1);

INSERT INTO
    movie_genre (movie_id, genre_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6);

    SELECT
    m.movie_id,
    d.director_id
    d.director_name,
    m.title,
    m.status,
    m.age_rating,
    m.runtime_min,
    m.release_date,
    m.trailer_link,
    m.description,
    m.banner_text,
    m.header_image,
    m.poster_image,
    m.synopsis,
    c.cast_name,
    g.genre_name
    FROM movies m
    INNER JOIN directors d ON m.director_id = d.director_id
    INNER JOIN movie_cast mc ON mc.movie_id = m.movie_id
    INNER JOIN cast_member c ON mc.cast_id = c.cast_id
    INNER JOIN movie_genre mg ON m.movie_id = mg.movie_id
    INNER JOIN genre g ON mg.genre_id = g.genre_id
