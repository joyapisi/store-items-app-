-- Create games table
CREATE TABLE games (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN,
  genre VARCHAR(255),
  publish_date DATE,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Create authors table
CREATE TABLE authors (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
