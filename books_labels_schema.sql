-- create label and book table
CREATE TABLE Label (
  id INTEGER PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);


CREATE TABLE Book(
  id int PRIMARY KEY NOT NULL,
  label_id INT,
  publisher VARCHAR(256),
  cover_state BOOLEAN,
  publish_date DATE,
  FOREIGN KEY (label_id) REFERENCES Genre(id)
);