.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color='blue' AND pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color='blue' AND pet='dog';


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b WHERE a.time < b.time AND a.pet=b.pet AND a.song=b.song;


CREATE TABLE sevens AS
  SELECT a.seven AS seven FROM students as a, numbers as b WHERE a.time=b.time AND a.number=7 AND b.'7'='True';


CREATE TABLE favpets AS
  SELECT pet, COUNT(*) FROM students GROUP BY pet ORDER BY COUNT(*) DESC LIMIT 10;


CREATE TABLE dog AS
  SELECT * FROM favpets WHERE pet='dog';


CREATE TABLE bluedog_agg AS
  SELECT song, COUNT(*) FROM bluedog_songs GROUP BY song ORDER BY COUNT(*) DESC;


CREATE TABLE instructor_obedience AS
  SELECT seven, instructor, COUNT(*) FROM students WHERE seven='7' GROUP BY instructor ORDER BY instructor;

