-- Users
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  username VARCHAR(30) NOT NULL,
  bio VARCHAR(400) NOT NULL DEFAULT '',
  avatar VARCHAR(200),
  phone VARCHAR(25),
  email VARCHAR(40),
  password VARCHAR(50),
  status VARCHAR(15),
  CHECK(COALESCE(phone, email) IS NOT NULL)
);

-- Comments
CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  contents VARCHAR(240) NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE
);

-- Posts
CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  url VARCHAR(200) NOT NULL,
  caption VARCHAR(240),
  lat REAL CHECK(lat IS NULL OR (lat >= -90 AND lat <= 90)),
  lng REAL CHECK(lng IS NULL OR (lng >= -180 AND lat <= 180)),
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

-- Likes
CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
  comment_id INTEGER REFERENCES comments(id) ON DELETE CASCADE,
  CHECK(
    COALESCE((post_id)::BOOLEAN::INTEGER, 0)
    +
    COALESCE((comment_id)::BOOLEAN::INTEGER, 0)
    = 1
  ),
  UNIQUE(user_id, post_id, comment_id)
);

-- table photo_tags {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   updated_at timestamp
--   post_id integer [ref: > posts.id]
--   user_id integer [ref: > users.id]
--   x integer
--   y integer
-- }

-- table caption_tags {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   post_id integer [ref: > posts.id]
--   user_id integer [ref: > users.id]
-- }

-- table hashtags {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   title VARCHAR(20)
-- }

-- table hashtags_posts {
--   id SERIAL [pk, increment]
--   hashtag_id integer [ref: > hashtags.id]
--   post_id integer [ref: > posts.id]
-- }

-- table followers {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   leader_id integer [ref: > users.id]
--   follower_id integer [ref: > users.id]
-- }
