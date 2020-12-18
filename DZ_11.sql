-- Задание1 Оптимизация

DROP IF EXSISTS logs;
CREATE  TABLE logs (
created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
table_name VARCHAR (16) NOT NULL COMMENT "Название таблицы",
id_table INT UNSIGNED NOT NULL COMMENT "Идентификатор первичного ключа",
name_table VARCHAR (32) NOT NULL  COMMENT "Содержание столба name"
) ENGINE = ARCHIVE;

-- Создание тригеров для заполнения таблицы

DELIMITER //
CREATE TRIGGER insert_user AFTER INSERT ON users
FOR EACH ROW 
BEGIN 
	INSERT INTO logs VALUES (NOW(), 'users', NEW.id, NEW.name);
END //

CREATE TRIGGER insert_catalog AFTER INSERT ON catalogs
FOR EACH ROW 
BEGIN 
	INSERT INTO logs VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //

CREATE TRIGGER insert_product AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
	INSERT INTO logs VALUES (NOW(), 'products', NEW.id, NEW.name);
END //

DELIMITER ;

-- NOSQL

-- Задание 1 Подобрать коллекцию для определения количества посещений с определенного IP адреса (структура)

HSET visitor <IP адрес> "<Время первого посещения> < время второго посещения>"
HLEN visitor <IP адрес> 

-- Задание 2 Поиск имени по электронному адресу и наоборот

HSET mail_name mail "name"
HSET name_mail name "mail"

-- Задание 3 Хранение категорий и товарных позиций в БД shop в MongoDB (структура)

db.shop.insert ({ <категория_1> : [<товарная позиция_1> ,< товарная позиция_2>]})
