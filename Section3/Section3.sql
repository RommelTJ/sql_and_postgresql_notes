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
