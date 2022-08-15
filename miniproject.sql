-- creating videos table
-- table has an unique ID, the title of the video, the length in minutes, and the URL.
CREATE TABLE public.videos (
video_id integer UNIQUE NOT NULL,
title VARCHAR(255) NOT NULL,
length integer,
URL VARCHAR(255) NOT NULL,
CONSTRAINT video_id_pkey PRIMARY KEY (video_id)
);

-- populating the table
INSERT INTO VIDEOS VALUES(092341, 'Confronting Jennette McCurdy | Her Unbelievable Home Horror Story', 3, 'https://www.youtube.com/watch?v=2XeKP_2YZ2M');
INSERT INTO VIDEOS VALUES(092342, 'Jennette McCurdy on Miranda Cosgrove Friendship, Potential Return to Acting (Exclusive)', 95, 'https://www.youtube.com/watch?v=_TYDEHKDYsc');
INSERT INTO VIDEOS VALUES(092343, 'A Nickelodeon Nightmare: The Allegations of Dan Schneider', 54, 'https://www.youtube.com/watch?v=XrxDR50v1gI');
INSERT INTO VIDEOS VALUES(092344, 'Jennette McCurdy gets candid about life as a child star in new memoir', 8, 'https://www.youtube.com/watch?v=gtMJwdP8TCs');

-- Check if data corrected is inserted
SELECT * FROM videos;

-- creating reviewers table
-- should include user’s name (“Asher”, “John”, etc.), rating (which could be NULL, or a number between 0 and 5), and a short text review and ID column
-- Reference: https://www.w3schools.com/sql/sql_check.asp
CREATE TABLE public.reviewers (
video_id integer UNIQUE NOT NULL,
user_name VARCHAR(255) NOT NULL,
rating integer,
text_review VARCHAR(75) NOT NULL,
CHECK (rating >= 0 AND rating <= 5),
CONSTRAINT video_id_fkey FOREIGN KEY (video_id)
   REFERENCES public.videos (video_id) MATCH SIMPLE
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
 );

-- populating the table
INSERT INTO REVIEWERS VALUES(092341, 'Larry Bam', 5, 'She was my favorite on iCarly when I was a kid.');
INSERT INTO REVIEWERS VALUES(092342, 'Cors Plank', 4, 'The way she owns and respects the boundaries she has is so inspiring');
INSERT INTO REVIEWERS VALUES(092343, 'Platta Rachel', 5, 'Honestly you’re the best person to break this all down.');
INSERT INTO REVIEWERS VALUES(092344, 'Marlyan Harald', 5, 'I’m proud of her. Seems like writing this book has helped her grow.');

-- checking if data was inserted correctly
SELECT * FROM reviewers;

-- JOIN statement that shows information from both tables
SELECT * FROM videos
LEFT JOIN reviewers
ON videos.video_id = reviewers.video_id
