CREATE DATABASE dz;
USE dz;
CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(64) NOT NULL COMMENT "Имя пользователя",
  birthday_at DATETIME NOT NULL COMMENT "День рождения пользователя пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

INSERT INTO users (id, name, birthday_at) VALUES (NULL, 'Иван','1990-10-05'),(NULL, 'Мария','1985-08-25'),(NULL, 'Наталия','1994-12-13');
SELECT * FROM users;

UPDATE users SET created_at=NOW(), updated_at=NOW();

