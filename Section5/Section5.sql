-- Schemas
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

-- Picturing Group By
SELECT user_id FROM comments GROUP BY user_id;

-- Aggregate Functions
SELECT MAX(id) FROM comments;

-- Combining Group By and Aggregates
SELECT user_id, MAX(id) FROM comments GROUP BY user_id;
-- Number of comments a user has made.
SELECT user_id, COUNT(id) FROM comments GROUP BY user_id;
