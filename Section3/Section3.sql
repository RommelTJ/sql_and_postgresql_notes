-- Create users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

-- Insert user
INSERT INTO users (username) VALUES ('monahan93'), ('pfeffer'), ('99stroman'), ('si93onis');
SELECT * FROM users;

-- Creating photos (foreign key example)
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

-- Insert photos
INSERT INTO photos (url, user_id) VALUES ('http://one.jpg', 4);
INSERT INTO photos (url, user_id)
VALUES
       ('http://two.jpg', 1),
       ('http://three.jpg', 1),
       ('http://four.jpg', 1),
       ('http://five.jpg', 2),
       ('http://six.jpg', 3),
       ('http://seven.jpg', 4);

-- Find all photos from user with id 4
SELECT * FROM photos WHERE user_id = 4;

-- List all photos with details about the associated user for each
SELECT * FROM photos JOIN users ON users.id = photos.user_id;

-- Foreign Key Constraints
INSERT INTO photos (url, user_id) VALUES ('http://jpg', 9999); -- ERROR!
INSERT INTO photos (url, user_id) VALUES ('http://jpg', NULL); -- Not tied to any user

-- Foreign Key Deleting Constraints
DELETE FROM users WHERE id = 1; -- Error
