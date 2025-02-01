CREATE TABLE IF NOT EXISTS t_user (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  status tinyint(1) DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO t_user (name, status) VALUES
('user01', 1),
('user02', 1),
('user03', 1),
('user04', 1),
('user05', 9);