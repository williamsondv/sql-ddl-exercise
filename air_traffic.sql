-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers 
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE cities 
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE countries 
(
id SERIAL PRIMARY KEY,
name TEXT NOT NULL
);

CREATE TABLE tickets
(
  passenger_id INT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city INT NOT NULL,
  from_country INT NOT NULL,
  to_city INT NOT NULL,
  to_country INT NOT NULL,
  FOREIGN KEY (from_city) REFERENCES cities(id),
  FOREIGN KEY (from_country) REFERENCES countries(id),
  FOREIGN KEY (to_city) REFERENCES cities(id),
  FOREIGN KEY (to_country) REFERENCES countries(id),
  FOREIGN KEY (passenger_id) REFERENCES passengers(id)
);

INSERT INTO passengers 
  (first_name, last_name)
  VALUES
  ('Jennifer','Finch'),
  ('Thaddeus','Gathercoal'),
  ('Sonja','Pauley'),
  ('Berkie','Wycliff'),
  ('Alvin','Leathes'),
  ('Cory','Squibs');

  INSERT INTO cities 
  (name)
  VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Beijing'),
  ('Sao Paolo'),
  ('Santiago'),
  ('New Orleans'),
  ('Chicago'),
  ('Casablanca'),
  ('Mexico City'),
  ('Las Vegas'),
  ('London');

 INSERT INTO countries 
  (name)
  VALUES
  ('Brazil'),
  ('United States'),
  ('Japan'),
  ('Chile'),
  ('France'),
  ('Morocco'),
  ('Mexico'),
  ('United Kingdom'),
  ('China'),
  ('UAE');

INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1,'33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United',1,2,3,2),
  (2,'8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways',2,3,18,10),
  (3,'12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta',9,2,13,2),
  (4,'20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta',4,2,7,2),
  (5,'23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium',5,5,15,6),
  (6,'18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China',10,9,6,10),
  (2,'9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United',8,2,14,2),
  (1,'1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines',17,2,1,2),
  (3,'32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines',9,2,3,2),
  (2,'10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil',11,1,12,4);

  

  