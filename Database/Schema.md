--- Insert Test Data

-- Insert Artists First
INSERT INTO Artist (artistId, name, bio) 
VALUES 
    (1, 'Taylor Swift', 'American singer-songwriter known for her narrative songwriting.'),
    (2, 'Kendrick Lamar', 'American rapper and songwriter known for his introspective lyrics.'),
    (3, 'Adele', 'English singer-songwriter known for her powerful voice and emotional ballads.');

-- Insert Genres Next
INSERT INTO Genre (genreId, name) 
VALUES 
    (1, 'Pop'),
    (2, 'Hip-Hop'),
    (3, 'R&B');

-- Insert Albums Next
INSERT INTO Album (albumId, title, releaseYear) 
VALUES 
    (1, '1989', 2014),
    (2, 'DAMN.', 2017),
    (3, '25', 2015);

-- Insert Songs (after Artists, Genres, and Albums exist)
INSERT INTO Song (title, bpm, releaseYear, Key, genreId, albumId, artistId) 
VALUES 
    ('Blinding Lights', 120, 2019, 'D Minor', 1, 1, 1),  -- Pop, Taylor Swift, 1989
    ('SICKO MODE', 80, 2018, 'A Minor', 2, 2, 2),        -- Hip-Hop, Kendrick Lamar, DAMN.
    ('Rolling in the Deep', 105, 2010, 'C Major', 3, 3, 3), -- R&B, Adele, 25
    ('Levitating', 103, 2020, 'F Major', 1, 1, 1),       -- Pop, Taylor Swift, 1989
    ('DNA.', 150, 2017, 'G Minor', 2, 2, 2),             -- Hip-Hop, Kendrick Lamar, DAMN.
    ('Someone Like You', 135, 2011, 'A Major', 3, 3, 3), -- R&B, Adele, 25
    ('Bad Guy', 135, 2019, 'A Minor', 1, 1, 1),         -- Pop, Taylor Swift, 1989
    ('HUMBLE.', 150, 2017, 'F Minor', 2, 2, 2),         -- Hip-Hop, Kendrick Lamar, DAMN.
    ('Set Fire to the Rain', 108, 2011, 'D Minor', 3, 3, 3), -- R&B, Adele, 25
    ('Watermelon Sugar', 95, 2019, 'F Major', 1, 1, 1);  -- Pop, Taylor Swift, 1989

-- Insert Playlists
INSERT INTO Playlist (playlistId, name, description) 
VALUES 
    (1, 'Chill Vibes', 'Relaxing songs for a calm evening.'),
    (2, 'Workout Beats', 'High-energy songs to keep you motivated.');

-- Insert Tags
INSERT INTO Tag (tagId, name) 
VALUES 
    (1, 'Upbeat'),
    (2, 'Emotional'),
    (3, 'Energetic');

--- Check Data
-- Check Artists 
SELECT * FROM Artist;

-- Check Genres
SELECT * FROM Genre;

-- Check Albums
SELECT * FROM Album;

-- Check Songs
SELECT * FROM Song;

-- Check Playlists
SELECT * FROM Playlist;

-- Check Tags
SELECT * FROM Tag;

--- Test Relationships
-- Get Songs with Album and Artist Information
SELECT 
    Song.title AS SongTitle, 
    Album.title AS AlbumTitle, 
    Artist.name AS ArtistName
FROM Song
JOIN Album ON Song.albumId = Album.albumId
JOIN Artist ON Song.artistId = Artist.artistId;

-- Get Songs by Genre
SELECT 
    Song.title AS SongTitle, 
    Genre.name AS GenreName
FROM Song
JOIN Genre ON Song.genreId = Genre.genreId;

--- Test Updates and Deletes
-- Update a Song's BPM
UPDATE Song 
SET bpm = 140 
WHERE songId = 1;

-- Delete a Song
DELETE FROM Song 
WHERE songId = 3;

-- Verify the Update and Delete
SELECT * FROM Song;

--- Test Foreign Key Constraints
-- Delete Songs First, Then Artist
DELETE FROM Song 
WHERE artistId = 1;

DELETE FROM Artist 
WHERE artistId = 1;

--- Final Verification
SELECT * FROM Artist;
SELECT * FROM Genre;
SELECT * FROM Album;
SELECT * FROM Song;
SELECT * FROM Playlist;
SELECT * FROM Tag;
