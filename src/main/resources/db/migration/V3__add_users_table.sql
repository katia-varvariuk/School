
CREATE TABLE Users (
                       UserID SERIAL PRIMARY KEY,
                       Username VARCHAR(50) NOT NULL UNIQUE,
                       Password VARCHAR(255) NOT NULL,
                       Role VARCHAR(20) NOT NULL
);
