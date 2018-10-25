USE sakila;

-- 1a
SELECT 
	first_name, last_name
FROM 
	actor;

-- 1b
SELECT 
	UPPER(concat(first_name, ' ', last_name)) AS `Actor Name`
FROM 
	actor;
    
-- 2a
SELECT
	actor_id, first_name, last_name
FROM 
	actor
WHERE 
	first_name LIKE '%Joe%';
    
-- 2b
SELECT * 
FROM 
	actor
WHERE 
	last_name LIKE '%GEN%';

-- 2c
SELECT *
FROM 
	actor
WHERE 
	last_name LIKE '%LI%'
ORDER BY 
	last_name, first_name;
    
-- 2d
SELECT 
	country_id, `country`
FROM 
	country
WHERE 
	`country` IN ("Afghanistan", "Bangladesh", "China");
    
-- 3a
ALTER TABLE
	actor
ADD COLUMN 
	description BLOB;

-- 3b
ALTER TABLE 
	actor
DROP COLUMN 
	description;
    
-- 4a 
SELECT 
	last_name, COUNT(last_name)
FROM 
	actor
GROUP BY 
	last_name
ORDER BY 
	COUNT(last_name) DESC;

-- 4b
SELECT 
	last_name, COUNT(last_name)
FROM 
	actor
GROUP BY 
	last_name
HAVING 
	COUNT(last_name) >= 2
ORDER BY 
	COUNT(last_name) DESC;
    
-- 4c
SET SQL_SAFE_UPDATES = 0;

UPDATE 
	actor
SET 
	first_name = 'Harpo'
WHERE 
	first_name = 'Groucho' AND last_name = 'Williams';

-- 4d
UPDATE
	actor
SET 
	first_name = 'Groucho'
WHERE 
	first_name = 'Harpo' AND last_name = 'Williams';

SET SQL_SAFE_UPDATES = 1;

-- 5a
DESCRIBE address;

-- 6a
SELECT 
	first_name, last_name, address
FROM 
	staff AS s
JOIN 
	address AS a
ON 
	s.address_id = a.address_id;

-- 6b
SELECT 
	s.staff_id, first_name, last_name, SUM(amount)
FROM
	payment AS p
JOIN
	staff AS s
ON 
	p.staff_id = s.staff_id
WHERE 
	extract(year from payment_date) = 2005
AND
	extract(month from payment_date) = 8;

-- 6c
SELECT 
	title, COUNT(actor_id) AS number_actors
FROM
	film AS f
INNER JOIN
	film_actor AS a
ON 
	f.film_id = a.film_id
GROUP BY 
	title
ORDER BY number_actors DESC;

-- 6d
SELECT 
	title, COUNT(title) AS number_copies
FROM 
	inventory AS i
JOIN 
	film as f
ON 
	i.film_id = f.film_id
WHERE 
	title LIKE '%Hunchback Impossible%';
    
-- 6e
SELECT 
	c.customer_id, last_name, SUM(amount) AS `Total Amount Paid`
FROM 
	customer AS c
JOIN 
	payment AS p
ON 
	c.customer_id = p.customer_id
GROUP BY 
	c.customer_id
ORDER BY
	last_name ASC;

-- 7a
SELECT 
	title
FROM(
	SELECT * 
	FROM
		film
	WHERE 
		language_id = 1) AS english
WHERE title LIKE 'K%' OR title LIKE'Q%';

-- 7b
SELECT 
	actor.actor_id, first_name, last_name
FROM(
	SELECT DISTINCT
		title, f.film_id
	FROM
		film AS f
	JOIN
		film_actor AS a
	ON 
		f.film_id = a.film_id
	WHERE
		title LIKE 'Alone Trip') AS alone_trip

JOIN
	actor
ON 
	alone_trip.actor_id = actor.actor_id;


SELECT distinct
		title, f.film_id
	FROM
		film AS f
	JOIN
		film_actor AS a
	ON 
		f.film_id = a.film_id
	WHERE
		title LIKE 'Alone Trip'


