use mavenmovies;

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 
SELECT first_name, last_name, email, store_id
FROM staff;


/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 
SELECT store_id, COUNT(*) AS count
FROM inventory
GROUP BY store_id;

/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/
SELECT store_id, COUNT(customer_id) AS count
FROM customer
WHERE active = 1
GROUP BY store_id;


/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/
SELECT COUNT(DISTINCT email) AS total_emails
FROM customer;


/*
5_1.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store.
*/
SELECT i.store_id, COUNT(DISTINCT f.title) AS count
FROM inventory i INNER JOIN film f USING(film_id)
GROUP BY i.store_id;


/*
5_2. And then provide a count of the unique categories of films you provide.
*/
SELECT COUNT(DISTINCT name) AS count
FROM category;


/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/
SELECT MIN(replacement_cost) AS min, MAX(replacement_cost) AS max, AVG(replacement_cost) AS average
FROM film;


/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
SELECT AVG(amount) AS average, MAX(amount) AS max
FROM payment;


/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS name, COUNT(r.rental_id) AS count
FROM customer c INNER JOIN rental r USING(customer_id)
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY count DESC;





/* 
9. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 
SELECT 
    CONCAT(s.first_name, ' ', s.last_name) AS manager_name, 
    a.address, a.district, ci.city, co.country
FROM store st
INNER JOIN staff s USING(store_id)
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id;


	
/*
10.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/
SELECT i.store_id, i.inventory_id, f.title AS name, f.rating, f.rental_rate, f.replacement_cost
FROM inventory i INNER JOIN film f USING(film_id)
ORDER BY i.store_id, i.inventory_id;

/*
SELECT DISTINCT store_id 
FROM inventory;
*/



/* 
11.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/
SELECT i.store_id, f.rating, COUNT(i.inventory_id) AS count
FROM inventory i
INNER JOIN film f USING(film_id)
GROUP BY i.store_id, f.rating
ORDER BY i.store_id, f.rating;



/* 
12. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 
SELECT i.store_id, c.name AS name, COUNT(f.film_id) count, AVG(f.replacement_cost) AS average, SUM(f.replacement_cost) AS cost
FROM inventory i INNER JOIN film f USING(film_id)
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY i.store_id, c.name
ORDER BY i.store_id, c.name;


/*
13.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.store_id,
    CASE 
        WHEN c.active = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS status,
    a.address, ci.city, co.country
FROM customer c
INNER JOIN address a USING(address_id)
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id;


/*
14.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_money
FROM customer c
LEFT JOIN rental r USING(customer_id)
LEFT JOIN payment p USING(rental_id)
GROUP BY c.customer_id, customer_name
ORDER BY total_money DESC;

    
/*
15. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS name, 'Advisor' AS type,
    NULL AS company_name
FROM advisor a

UNION

SELECT 
    CONCAT(i.first_name, ' ', i.last_name) AS name,'Investor' AS type,
    i.company_name
FROM investor i
ORDER BY type, name;


/*
16. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/


