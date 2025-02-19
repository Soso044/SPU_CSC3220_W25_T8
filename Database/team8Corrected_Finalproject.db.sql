--
-- File generated with SQLiteStudio v3.4.13 on Wed Feb 19 14:51:05 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Album
CREATE TABLE Album (
    albumId     INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT    NOT NULL,
    releaseYear INTEGER NOT NULL
)
STRICT;


-- Table: Artist
CREATE TABLE Artist (
    artistId INTEGER PRIMARY KEY AUTOINCREMENT,
    name     TEXT    NOT NULL,
    bio      TEXT
)
STRICT;


-- Table: Genre
CREATE TABLE Genre (
    genreId INTEGER PRIMARY KEY AUTOINCREMENT,
    name    TEXT    NOT NULL
)
STRICT;


-- Table: Playlist
CREATE TABLE Playlist (
    playlistId  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    description TEXT
)
STRICT;


-- Table: Similar
CREATE TABLE Similar (
    song1Id INTEGER PRIMARY KEY AUTOINCREMENT
                    REFERENCES Song (songId),
    song2Id INTEGER REFERENCES Song (songId) 
)
STRICT;


-- Table: Song
CREATE TABLE Song (
    songId      INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT    NOT NULL,
    bpm         INTEGER NOT NULL,
    releaseYear INTEGER NOT NULL,
    key         TEXT    NOT NULL
)
STRICT;


-- Table: Song_Album_Artist
CREATE TABLE Song_Album_Artist (
    Id       INTEGER PRIMARY KEY AUTOINCREMENT,
    songId   INTEGER REFERENCES Song (songId),
    albumId  INTEGER REFERENCES Album (albumId),
    artistId INTEGER REFERENCES Artist (artistId) 
);


-- Table: Song_Artist
CREATE TABLE Song_Artist (
    Id       INTEGER PRIMARY KEY AUTOINCREMENT,
    songId   INTEGER REFERENCES Song (songId),
    artistId INTEGER REFERENCES Artist (artistId) 
);


-- Table: Song_Genre
CREATE TABLE Song_Genre (
    Id      INTEGER PRIMARY KEY AUTOINCREMENT,
    songId          REFERENCES Song (songId),
    genreId         REFERENCES Genre (genreId) 
);


-- Table: Tag
CREATE TABLE Tag (
    tagId INTEGER PRIMARY KEY AUTOINCREMENT,
    name  TEXT    NOT NULL
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
