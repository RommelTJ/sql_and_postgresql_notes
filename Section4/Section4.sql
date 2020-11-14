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
