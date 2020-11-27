CREATE DATABASE dzv;
USE dzv;
CREATE TABLE users (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(64) NOT NULL COMMENT "Имя пользователя",
  birthday_at DATETIME NOT NULL COMMENT "День рождения пользователя пользователя",
  created_at VARCHAR(64) NOT NULL COMMENT "Время создания строки",  
  updated_at VARCHAR(64) NOT NULL COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

INSERT INTO users (id, name, birthday_at, created_at, updated_at) VALUES (NULL, 'Иван','1990-10-05', '20.10.2017', '18.11.2020'),(NULL, 'Мария','1985-08-25', '28.12.2015', '20.11.2020'),(NULL, 'Наталия','1994-12-13','22.09.2019', '13.09.2020');
SELECT * FROM users;

ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

 
