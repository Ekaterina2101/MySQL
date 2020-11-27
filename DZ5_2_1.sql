USE dz;
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(64) NOT NULL COMMENT "Имя пользователя",
  birthday_at DATETIME NOT NULL COMMENT "День рождения пользователя пользователя",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Пользователи";  

INSERT INTO users (id, name, birthday_at) VALUES (NULL, 'Иван','1990-10-05'),(NULL, 'Мария','1985-08-25'),(NULL, 'Наталия','1994-12-13');
SELECT * FROM users;
INSERT INTO users (id, name, birthday_at) VALUES (NULL, 'Константин','1990-05-05'),(NULL, 'Елена','1985-08-25'),(NULL, 'Ирина','1994-05-13');



SELECT ROUND(AVG(age),1) FROM (SELECT TIMESTAMPDIFF (YEAR, birthday_at, NOW()) AS age FROM users) AS midl_age;


