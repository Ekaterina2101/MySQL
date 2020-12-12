-- Задание 1 Транзакции, переменные, представления
CREATE DATABASE shop_1 ;
USE shop_1;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR (64)
);

INSERT  INTO users VALUES (NULL, 'OLEG'), (NULL, 'Georg');
SELECT *FROM users;

CREATE DATABASE sample_1 ;
USE sample_1;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR (64)
);

START TRANSACTION ;
  INSERT INTO sample_1.users SELECT * FROM shop_1.users WHERE id=1;
  DELETE FROM shop_1.users WHERE id=1;
 COMMIT;
SELECT * FROM shop_1.users ;

-- Задание 2 Транзакции, переменные, представления
USE shop_1;

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR (64),
  catalog_id INT UNSIGNED
);

CREATE TABLE catalogs (
  id INT UNSIGNED PRIMARY KEY,
  name VARCHAR (64)
);
  
INSERT  INTO products VALUES (NULL, 'Ножницы',1), (NULL, 'Скоч', 2), (NULL, 'Клей',2);  
INSERT  INTO catalogs VALUES (NULL, 'Инструменты'), (NULL, 'Материалы');

CREATE VIEW ver (product, catalog) AS SELECT name , (SELECT name FROM catalogs WHERE id= products.catalog_id) FROM products;
SELECT * FROM ver;

-- Задание 1 Хранимые процедуры и функции, триггеры

DELIMITER //
CREATE FUNCTION hello ()
RETURN TINYTEXT 
BEGIN
	DECLARE t TIME;
	SET t=CURRENT_TIME();
	CASE 
	    WHEN t BETWEEN 06:00:00 AND 12:00:00 THEN 
	    RETURN 'Доброе утро!';
	    WHEN t BETWEEN 12:00:00 AND 18:00:00 THEN 
	    RETURN 'Добрый день!';
	    WHEN CURRENT_TIME() BETWEEN 18:00:00 AND 00:00:00 THEN 
	    RETURN 'Добрый вечер!';
	    WHEN t BETWEEN 00:00:00 AND 06:00:00 THEN 
	    RETURN 'Доброй ночи!';
	END CASE;
END //

SELECT hello() ;

-- Задание 2 Хранимые процедуры и функции, триггеры

CREATE TRIGGER products_trig BEFORE INSERT ON products
FOR EACH ROW
BEGIN 
	IF (NEW.name=NULL AND NEW.description = NULL) THEN
	    SELECT 'Ошибка ввода данных';
    ELSE
       SET NEW.name =NEW.name;
       SET NEW.description =NEW.description;
    END IF;
END //

  