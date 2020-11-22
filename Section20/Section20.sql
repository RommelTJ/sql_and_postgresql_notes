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

-- table comments {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   updated_at timestamp
--   contents varchar(240)
--   user_id integer [ref: > users.id]
--   post_id integer [ref: > posts.id]
-- }

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

-- table likes {
--   id SERIAL [pk, increment]
--   created_at timestamp
--   user_id integer [ref: > users.id]
--   post_id integer [ref: > posts.id]
--   comment_id integer [ref: > comments.id]
-- }

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
