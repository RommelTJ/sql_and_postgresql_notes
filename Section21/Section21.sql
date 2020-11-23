-- Highest user id's exercise
SELECT id FROM users ORDER BY id DESC LIMIT 3;

-- Posts by a Particular User
-- Join users and posts table. Show username of user id 200 and captions of all posts they have created
SELECT username, caption FROM users JOIN posts ON (users.id = posts.user_id) WHERE users.id = 200;
