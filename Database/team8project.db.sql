--
-- File generated with SQLiteStudio v3.4.13 on Mon Feb 17 14:52:17 2025
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
    Key         TEXT    NOT NULL,
    genreId     INTEGER,
    albumId     INTEGER,
    artistId    INTEGER,
    FOREIGN KEY (
        genreId
    )
    REFERENCES Genre (genreId) ON DELETE CASCADE,
    FOREIGN KEY (
        albumId
    )
    REFERENCES Album (albumId) ON DELETE CASCADE,
    FOREIGN KEY (
        artistId
    )
    REFERENCES Artist (artistId) ON DELETE CASCADE
);


-- Table: Tag
CREATE TABLE Tag (
    tagId INTEGER PRIMARY KEY AUTOINCREMENT,
    name  TEXT    NOT NULL
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
