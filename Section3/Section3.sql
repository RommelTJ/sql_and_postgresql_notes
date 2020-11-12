-- Create users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

-- Insert user
INSERT INTO users (username) VALUES ('monahan93'), ('pfeffer'), ('99stroman'), ('si93onis');
SELECT * FROM users;
