DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id   SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    user_name TEXT,
    password TEXT,
    role TEXT
);