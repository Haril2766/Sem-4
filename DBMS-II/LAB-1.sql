------------------------------Part A----------------------------
--1. Retrieve a unique genre of songs.
SELECT DISTINCT Genre
FROM SONGS

--2. Find top 2 albums released before 2010. 
SELECT TOP 2 Album_title 
FROM Albums WHERE Release_year < '2010'

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005) 
INSERT INTO Songs
VALUES
(1245,'Zaroor',2.55,'Feel good', 1005)


--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE Songs 
SET Genre = 'Happy' 
WHERE Genre = 'Zaroor'  

--5. Delete an Artist ‘Ed Sheeran’ 
DELETE FROM Artists 
WHERE Artist_name = 'Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
ALTER TABLE Songs 
ADD Ratings Decimal(3,2)

--7. Retrieve songs whose title starts with 'S'. 
SELECT Song_title 
FROM Songs 
WHERE Song_title Like 'S%'

--8. Retrieve all songs whose title contains 'Everybody'. 
SELECT Song_title 
FROM Songs 
WHERE Song_title Like '%Everybody%'

--9. Display Artist Name in Uppercase. 
SELECT UPPER(Artist_name) 
FROM Artists

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
SELECT SQRT(Duration) 
FROM Songs 
WHERE Song_title = 'Good Luck'

--11. Find Current Date. 
SELECT GETDATE()

--12. Find the number of albums for each artist. 
SELECT Count(Album_id)
fROM Albums JOIN Artists
ON Albums.Artist_id = Artists.Artist_id 
GROUP BY Artists.Artist_name

--13. Retrieve the Album_id which has more than 5 songs in it. 
SELECT Albums.Album_id
FROM Albums Join Songs
ON Albums.Album_id = Songs.Album_id
GROUP BY Albums.Album_id
HAVING COUNT(Song_id) > 5

--14. Retrieve all songs from the album 'Album1'. (using Subquery) 
SELECT Songs.Song_title 
FROM Songs JOIN Albums
ON Songs.Album_id = Albums.Album_id
WHERE Albums.Album_title = 'Album1'

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 
SELECT Albums.Album_title 
FROM Albums join Artists
ON Albums.Artist_id = Artists.Artist_id
WHERE Artists.Artist_name = 'Aparshakti Khurana'

--16. Retrieve all the song titles with its album title. 
SELECT Songs.Song_title,Albums.Album_title
FROM Songs JOIN Albums
ON Songs.Album_id = Albums.Album_id
 
--17. Find all the songs which are released in 2020. 
SELECT Song_title 
FROM Songs JOIN Albums
ON Songs.Album_id = Albums.Album_id
WHERE Release_year = 2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.  
CREATE VIEW Fav_Songs
AS
SELECT * fFROM Songs 
WHERE Song_id BETWEEN 101 AND 105

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view. 
UPDATE Fav_Songs 
SET Song_title = 'Jannat' 
WHERE song_id = 101

--20. Find all artists who have released an album in 2020.  
SELECT * FROM Artists 
JOIN Albums
ON Artists.Artist_id = Albums.Artist_id 
WHERE Release_year = 2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT Song_title, Duration
FROM Artists
JOIN Albums ON Artists.Artist_id = Albums.Artist_id
JOIN Songs ON Songs.Album_id = Albums.Album_id
WHERE Artist_name = 'Shreya Ghoshal'
ORDER BY Duration

