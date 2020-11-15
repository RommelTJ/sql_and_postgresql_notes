-- Schema definitions
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(50)
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  contents VARCHAR(240),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  photo_id INTEGER REFERENCES photos(id) ON DELETE CASCADE
);

-- For each comment, show contents of comment and the username of the user who wrote it.
SELECT contents, username FROM comments JOIN users on users.id = comments.user_id;

-- For each comment, list contents of comment and URL of photo the comment was added to.
SELECT contents, url FROM comments JOIN photos ON comments.photo_id = photos.id;

-- Show each photo url and the username of the poster
SELECT url, username FROM photos JOIN users on users.id = photos.user_id;

-- Making missing data in Joins
INSERT INTO photos (url, user_id) VALUES ('http://banner.jpg', NULL);
SELECT url, username FROM photos LEFT JOIN users on users.id = photos.user_id;

-- Testing right join
INSERT INTO users (username) VALUES ('Nicole');
SELECT url, username FROM photos RIGHT JOIN users on users.id = photos.user_id;

-- Testing full join
SELECT url, username FROM photos FULL JOIN users on users.id = photos.user_id;

-- Users can comment on photos they posted. List the url and contents for every photo/comment where this occurred.
-- Who is commenting on their own photos?
SELECT url, contents FROM photos JOIN comments ON comments.photo_id = photos.id WHERE photos.user_id = comments.user_id;

-- Also add the username with a three way join
SELECT url, contents, username
FROM photos
JOIN comments ON comments.photo_id = photos.id
JOIN users ON users.id = photos.user_id
WHERE photos.user_id = comments.user_id;
