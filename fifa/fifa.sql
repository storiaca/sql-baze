CREATE TABLE teams (
    team_id int(11) NOT NULL AUTO_INCREMENT,
    name varchar(200),
    short_name varchar(20),
    team_logo varchar(200),
    created_at timestamp NOT NULL DEFAULT current_timestamp(),
    updated_at timestamp NOT NULL DEFAULT current_timestamp(),
    CONSTRAINT pk_teams PRIMARY KEY (team_id)
);

INSERT INTO
    teams (team_id, name, short_name)
VALUES
    (1, 'Australia', 'AUS');

-- This is a comment
/*
  This block is a comment
*/