# SQL Queries for Song Database  

```sql
PRAGMA foreign_keys = ON;
-- Insert sample artists into the Artist table  
INSERT INTO Artist (name, bio) 
VALUES ('Drake', 'Canadian rapper and singer'),
       ('Burna Boy', 'Afrobeats superstar'),
       ('Adele', 'British singer and songwriter'),
       ('Wizkid', 'Nigerian Afrobeats artist');
-- Insert sample albums into the Album table  
INSERT INTO Album (title, releaseYear) 
VALUES ('Certified Lover Boy', 2021),
       ('Love, Damini', 2022),
       ('25', 2015),
       ('Made in Lagos', 2020);
-- Insert sample genres into the Genre table  
INSERT INTO Genre (name) 
VALUES ('Hip-Hop'),
       ('Afrobeats'),
       ('Pop'),
       ('R&B');
-- Insert sample songs into the Song table  
INSERT INTO Song (title, bpm, releaseYear, key) 
VALUES ('God’s Plan', 77, 2018, 'B Minor'),
       ('Last Last', 105, 2022, 'D Major'),
       ('Hello', 78, 2015, 'F Minor'),
       ('Essence', 100, 2020, 'C# Major');
-- Link "God’s Plan" to Drake, Certified Lover Boy album, and Hip-Hop genre  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'God’s Plan'),
    (SELECT artistId FROM Artist WHERE name = 'Drake'),
    (SELECT albumId FROM Album WHERE title = 'Certified Lover Boy'),
    (SELECT genreId FROM Genre WHERE name = 'Hip-Hop')
);
-- Link "Last Last" to Burna Boy, Love Damini album, and Afrobeats genre  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'Last Last'),
    (SELECT artistId FROM Artist WHERE name = 'Burna Boy'),
    (SELECT albumId FROM Album WHERE title = 'Love, Damini'),
    (SELECT genreId FROM Genre WHERE name = 'Afrobeats')
);
-- Link "Hello" to Adele, 25 album, and Pop genre  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'Hello'),
    (SELECT artistId FROM Artist WHERE name = 'Adele'),
    (SELECT albumId FROM Album WHERE title = '25'),
    (SELECT genreId FROM Genre WHERE name = 'Pop')
);
-- Link "Essence" to Wizkid, Made in Lagos album, and Afrobeats genre  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'Essence'),
    (SELECT artistId FROM Artist WHERE name = 'Wizkid'),
    (SELECT albumId FROM Album WHERE title = 'Made in Lagos'),
    (SELECT genreId FROM Genre WHERE name = 'Afrobeats')
);

-- Link "Essence" to Wizkid, Made in Lagos album, and R&B genre  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'Essence'),
    (SELECT artistId FROM Artist WHERE name = 'Wizkid'),
    (SELECT albumId FROM Album WHERE title = 'Made in Lagos'),
    (SELECT genreId FROM Genre WHERE name = 'R&B')
);
-- One SELECT statement that joins two tables and limits the result set using the WHERE clause
SELECT Song.title, Artist.name 
FROM [Song-Metadata]
JOIN Song ON [Song-Metadata].songId = Song.songId
JOIN Artist ON [Song-Metadata].artistId = Artist.artistId
WHERE Artist.name = 'Wizkid';
-- One transaction that UPDATES that updates at least two columns in at least two rows and updates related tables as necessary.  
BEGIN TRANSACTION;
UPDATE Song 
SET bpm = 102, releaseYear = 2021
WHERE title = 'Essence';
UPDATE Song 
SET bpm = 80, releaseYear = 2016
WHERE title = 'Hello';
COMMIT;
--- One transaction that INSERTS a row into a table and all related tables as necessary.
BEGIN TRANSACTION;
-- Insert a new artist  
INSERT INTO Artist (name, bio) 
VALUES ('Rema', 'Nigerian Afrobeat singer');

-- Insert a new album  
INSERT INTO Album (title, releaseYear) 
VALUES ('Rave & Roses', 2022);

-- Insert a new genre  
INSERT INTO Genre (name) 
VALUES ('Afrobeats');

-- Insert a new song  
INSERT INTO Song (title, bpm, releaseYear, key) 
VALUES ('Calm Down', 107, 2022, 'A Minor');

-- Link them in Song-Metadata (Using subqueries for IDs)  
INSERT INTO [Song-Metadata] (songId, artistId, albumId, genreId) 
VALUES (
    (SELECT songId FROM Song WHERE title = 'Calm Down'),
    (SELECT artistId FROM Artist WHERE name = 'Rema'),
    (SELECT albumId FROM Album WHERE title = 'Rave & Roses'),
    (SELECT genreId FROM Genre WHERE name = 'Afrobeats')
);
COMMIT;
-- One transaction that DELETES a row from a table and all related tables as necessary.
BEGIN TRANSACTION;
-- Remove references first to avoid foreign key issues  
DELETE FROM [Song-Metadata] WHERE songId = (SELECT songId FROM Song WHERE title = 'God’s Plan');
-- Delete the song itself  
DELETE FROM Song WHERE title = 'God’s Plan';
COMMIT;


