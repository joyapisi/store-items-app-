CREATE TABLE Genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  items VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE MusicAlbum(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
);