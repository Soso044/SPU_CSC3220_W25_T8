--
-- File generated with SQLiteStudio v3.4.13 on Tue Feb 18 09:39:16 2025
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
);


-- Table: Artist
CREATE TABLE Artist (
    artistId INTEGER PRIMARY KEY AUTOINCREMENT,
    name     TEXT    NOT NULL,
    bio      TEXT
);


-- Table: Genre
CREATE TABLE Genre (
    genreId INTEGER PRIMARY KEY AUTOINCREMENT,
    name    TEXT    NOT NULL
);


-- Table: Playlist
CREATE TABLE Playlist (
    playlistId  INTEGER PRIMARY KEY AUTOINCREMENT,
    name        TEXT    NOT NULL,
    description TEXT
);


-- Table: Similar
CREATE TABLE Similar (
    song1Id INTEGER,
    song2Id INTEGER,
    FOREIGN KEY (
        song1Id
    )
    REFERENCES Song (songId) ON DELETE CASCADE,
    FOREIGN KEY (
        song2Id
    )
    REFERENCES Song (songId) ON DELETE CASCADE,
    PRIMARY KEY (
        song1Id,
        song2Id
    )
);


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
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
