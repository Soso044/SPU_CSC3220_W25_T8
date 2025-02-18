--
-- File generated with SQLiteStudio v3.4.13 on Tue Feb 18 09:52:13 2025
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


-- Table: Song-Metadata
CREATE TABLE [Song-Metadata] (
    Id       INTEGER PRIMARY KEY AUTOINCREMENT,
    songId   INTEGER REFERENCES Song (songId),
    artistId INTEGER REFERENCES Artist (artistId),
    albumId  INTEGER REFERENCES Album (albumId),
    genreId  INTEGER REFERENCES Genre (genreId) 
)
STRICT;


-- Table: Tag
CREATE TABLE Tag (
    tagId INTEGER PRIMARY KEY AUTOINCREMENT,
    name  TEXT    NOT NULL
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
