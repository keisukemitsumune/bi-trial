CREATE TABLE IF NOT EXISTS t_item_types (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO t_item_types (id, name) VALUES
(1, '生活家電'),
(2, 'キッチン家電'),
(3, 'デジタル家電'),
(4, '健康美容'),
(5, '寝具・ファッション'),
(6, '生活用品');