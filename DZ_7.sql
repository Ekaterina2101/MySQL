-- Задача 1
 SELECT * FROM users 
 WHERE EXISTS (SELECT * FROM orders WHERE user_id = users.id );

-- Версия JOIN

SELECT * 
FROM
  users AS u 
JOIN
  orders AS o
ON 
  o.user_id = u.id;


-- Задача 2
SELECT 
  p.name,
  c.name
FROM 
  catalogs AS c
JOIN
  products AS p
ON 
  c.id=p.catalog_id;
  
-- Задача 3


  SELECT
  f.id,
  c.name AS 'Откуда',
  b.name AS 'Куда'
FROM 
  tlights AS f
JOIN
  cities AS c
JOIN
  cities AS b 
ON
  f.from_=c.label AND f.to_=b.label;
  
 
 CREATE TABLE tlights(
   id SERIAL PRIMARY KEY,
   from_ VARCHAR(255)  NOT NULL ,
   to_ VARCHAR(100) NOT NULL 
 );
  INSERT INTO tlights (id, from_ , to_ ) VALUES (NULL, 'moscow', 'omsk'),(NULL, 'novgorod', 'kazan');
 
 CREATE TABLE cities(
   label VARCHAR(255)  NOT NULL ,
   name VARCHAR(100) NOT NULL 
 );
  INSERT INTO cities (label , name ) VALUES ( 'omsk', 'Омск'),('kazan', 'Казань');
 
 
 