--CREATE DATABASE IF NOT EXISTS dz;
USE dz;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(64) NOT NULL COMMENT "Название товара",
  value INT UNSIGNED  NOT NULL COMMENT "Количество товара",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Склад";  

INSERT INTO storehouses_products (id, name, value) VALUES (NULL, 'Принтер',4),(NULL, 'Сканер',3),(NULL, 'Ксерокс',1), (NULL, 'Степлер',0), (NULL, 'Скоч',0);       
SELECT * FROM storehouses_products;
SELECT id, value FROM storehouses_products ORDER BY value =0, value ;


