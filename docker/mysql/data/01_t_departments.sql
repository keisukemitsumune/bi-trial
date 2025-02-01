CREATE TABLE IF NOT EXISTS t_departments (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO t_departments (id, name) VALUES
( 1, '札幌支店'),
( 2, '仙台支店'),
( 3, '大宮支店'),
( 4, '東京本店'),
( 5, '千葉支店'),
( 6, '横浜支店'),
( 7, '浜松支店'),
( 8, '名古屋支店'),
( 9, '大阪支店'),
(10, '神戸支店'),
(11, '高松支店'),
(12, '岡山支店'),
(13, '広島支店'),
(14, '福岡支店'),
(15, '那覇支店');