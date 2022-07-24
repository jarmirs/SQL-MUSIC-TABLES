CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    birthplace VARCHAR,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL
);

CREATE TABLE favorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    user_id INTEGER NOT NULL,
    artist_id INTEGER,
    album_id INTEGER,
    song_id INTEGER,
    genre_id INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (artist_id) REFERENCES artists (id),
    FOREIGN KEY (album_id) REFERENCES albums (id),
    FOREIGN KEY (song_id) REFERENCES songs (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id)
);

INSERT INTO users 
(
  first_name, 
  last_name,
  birthplace,
  created_at
)  
VALUES 
(	
  'Usain', 
  'Bolt', 
  'Kingston, Jamaica',
  CURRENT_TIMESTAMP
);

INSERT INTO users 
(
  first_name, 
  last_name,
  birthplace,
  created_at
)  
VALUES 
(	
  'Michael', 
  'Jordan', 
  'Wilmington, North Carolina',
  CURRENT_TIMESTAMP
);

INSERT INTO users 
(
  first_name, 
  last_name,
  birthplace,
  created_at
)  
VALUES 
(	
  'Fred', 
  'Kerley', 
  'New York, New York',
  CURRENT_TIMESTAMP
);
INSERT INTO users 
(
  first_name, 
  last_name,
  birthplace,
  created_at
)
VALUES
(
  'Michael ', 
  'Johnson', 
  'Syracuse, New York',
  CURRENT_TIMESTAMP
);

INSERT INTO users 
(
	first_name,
  	last_name,
  	birthplace,
  	created_at
)
VALUES 
(
	'Florence',
  	'Griffith-Joyner',
  	'Littlerock, California',
  	CURRENT_TIMESTAMP
),
(
	'Elaine',
  	'Thompson-Herah',
  	'Manchester, Jamaicaa',
  	CURRENT_TIMESTAMP
);

INSERT INTO
    favorites(user_id, created_at)
VALUES
    (1, CURRENT_TIMESTAMP),
    (2, CURRENT_TIMESTAMP),
    (3, CURRENT_TIMESTAMP),
    (4, CURRENT_TIMESTAMP),
    (5, CURRENT_TIMESTAMP),
    (6, CURRENT_TIMESTAMP);

SELECT
    songs.id AS SongId,
    songs.name,
    songs.album_id,
    albums.name,
    albums.genre_id,
    albums.artist_id
FROM
    songs
    INNER JOIN albums ON albums.id = songs.album_id;

UPDATE
    favorites
SET
    artist_id =49 ,
    album_id = 61,
    song_Id = 654,
    genre_id = 4,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 1;

UPDATE
    favorites
SET
    artist_id =38,
    album_id = 49,
    song_Id = 519,
    genre_id = 12,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 2;

UPDATE
    favorites
SET
    artist_id =17 ,
    album_id = 17,
    song_Id = 74,
    genre_id = 9,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 3;

UPDATE
    favorites
SET
    artist_id =39 ,
    album_id = 51,
    song_Id = 537,
    genre_id = 12,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 4;
    UPDATE
    favorites
SET
    artist_id =54 ,
    album_id = 66,
    song_Id = 724,
    genre_id = 4,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 5;
    UPDATE
    favorites
SET
    artist_id =17 ,
    album_id = 17,
    song_Id = 73,
    genre_id = 4,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = 6;

-- Get a random
SELECT
    *
FROM
    songs
ORDER BY
    RANDOM()
LIMIT
    1;

SELECT
    users.first_name,
    songs.name AS SongName,
    artists.name AS ArtistName,
    albums.name AS Album,
    genres.name AS Genre
FROM
    users
    INNER JOIN favorites ON users.id = favorites.user_id
    INNER JOIN artists ON artists.id = favorites.artist_id
    INNER JOIN songs ON songs.id = favorites.song_id
    INNER JOIN albums ON albums.id = favorites.album_id
    INNER JOIN genres ON genres.id = favorites.genre_id;