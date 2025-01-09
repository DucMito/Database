USE sakila;

-- 1. How many category film we have?
select count(*) from category;
-- 2. Count the number of "ACTION" films
select count(*) from category
where name='ACTION';
-- 3. Count the number of unique customers who have in rental table
select distinct count(customer_id) 
from rental;

-- 4. Select the film title and length of all films that have length greater than the average film length
SELECT title, length 
FROM film 
WHERE length > (SELECT AVG(length) FROM film);
-- 5. Select the maximum number and the minimum number of films for each category
SELECT c.name AS category_name, 
       MAX(f.length) AS max_length, 
       MIN(f.length) AS min_length
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;
-- 6. Tell me each category name and the number of films for that category
SELECT c.name AS category_name, COUNT(fc.film_id) AS number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- 7. concatenate the film titles and length from the films table
SELECT CONCAT(title, ' (', length, ' min)') AS film_info FROM film;


-- 8. Extract the customers email from the 5th character onwards
SELECT SUBSTRING(email, 5) AS email_extracted FROM customer;

-- 9. Tell me the customers first name in lower case and last name in upper case for each customer who have last name is "Smith"
SELECT LOWER(first_name) AS first_name_lower, UPPER(last_name) AS last_name_upper 
FROM customer 
WHERE last_name = 'Smith';
-- 10. Tell me the last 3 letters of each film title from the films table
SELECT RIGHT(title, 3) AS last_three_letters FROM film;
-- 11. Concatenate the first three letters in the first name and last name columns together from the customers table
SELECT CONCAT(LEFT(first_name, 3), LEFT(last_name, 3)) AS short_name 
FROM customer;
-- 12. Which films are over 2 hours long?
SELECT title 
FROM film 
WHERE length > 120;
-- 13. Which category name had the most film?
SELECT c.name AS category_name, COUNT(fc.film_id) AS number_of_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY number_of_films DESC
LIMIT 1;

-- 14. How many actor for the film 'AFFAIR PREJUDICE'?
SELECT COUNT(*) AS number_of_actors
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'AFFAIR PREJUDICE';
-- 15. Which 5 customers made the most rental?
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rentals DESC
LIMIT 5;

-- 16. Which films were shown in category 'Action'?

-- 17. How many of the customers made a rental?
SELECT COUNT(DISTINCT customer_id) AS customers_with_rentals FROM rental;


