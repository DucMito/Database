use sakila;

/*
1. I’m going to send an email letting our customers know there has been a management change.
Could you pull a list of the first name, last name, and email of each of our customers?
*/
select first_name, last_name, email from customer;

/*
2. My understanding is that we have titles that we rent for durations of 3, 5, or 7 days. 
Could you pull the records of our films and see if there are any other rental durations?
*/
select distinct rental_duration
from film
where rental_duration not in (3,5,7);

/*
3. I’d like to look at payment records for our long-term customers to learn about their purchase patterns.
Could you pull all payments from our first 100 customers (based on customer ID)?
*/
select * from payment
where customer_id <= 100;

/*
4. 	The payment data you gave me on our first 100 customers was great – thank you! 
Now I’d love to see just payments over $5 for those same customers, since June 1, 2005.
*/
select * from payment
where customer_id <= 100 and amount > 5 and payment_date >= '2005-06-01';

/*
5. The data you shared previously on customers 42, 53, 60, and 75 was good to see.
Now, could you please write a query to pull all payments from those specific customers, 
along with payments over $5, from any customer?
*/
select * from payment
where customer_id in (42,53,60,75) and amount > 5;

/*
6. We need to understand the special features in our films.
Could you pull a list of films which include a 'Behind the Scenes' special feature?
*/
select * from film
where special_features = 'Behind the Scenes';

select * from film
where special_features like '%Behind the Scenes%';

/*
7.	I need to get a quick overview of how long our movies tend to be rented out for.
Could you please pull a count of titles sliced by rental duration?
*/
select rental_duration, COUNT(*) as count
from film
group by rental_duration;


/*
8.	I’m wondering if we charge more for a rental when the replacement cost is higher. 
Can you help me pull a count of films, along with the average, min, and max rental rate, grouped by replacement cost?
*/

select count(*) as count_film, avg(rental_rate) as avg, min(rental_rate) as min, max(rental_rate) max
from film
group by replacement_cost;
/*
9.	I’d like to talk to customers that have not rented much from us to understand if there is something we could be doing better.
Could you pull a list of customer_ids with less than 15 rentals all-time?
*/

select customer_id
from rental
group by customer_id
having count(*) < 15;


/*
10.	I’d like to see if our longest films also tend to be our most expensive rentals.
Could you pull me a list of all film titles along with their lengths and rental rates, and sort them from longest to shortest?
*/
select title, length, rental_rate
from film
order by length DESC;

-- CASE STATEMENT --
/*
11.	I’m curious how many inactive customers we have at each store.
Could you please create a table to count the number of customers broken down by store_id (in rows), and active status (in columns)?
*/
select store_id, active, count(*) as customer_count
from customer
group by active, store_id;

/*
12.	Can you pull for me a list of each film we have in inventory?
I would like to see the film’s title, description, and the store_id value associated with each item, and its inventory_id. Thanks!
*/
select f.film_id ,i.store_id, i.inventory_id, f.title, f.description
from inventory i inner join film f using(film_id)
order by i.store_id, i.inventory_id;

/*
13.	One of our investors is interested in the films we carry and how many actors are listed for each film title.
Can you pull a list of all titles, and figure out how many actors are associated with each title?
*/
select f.title, count(*) as actor_count
from film f inner join film_actor fa using(film_id)
group by f.title
order by actor_count desc;

/*
14.	Customers often ask which films their favorite actors appear in.
It would be great to have a list of all actors, with each film title that they appear in. 
Could you please pull that for me?
*/
select f.film_id, a.actor_id, a.first_name, a.last_name, f.title
from actor a
inner join film_actor fa using(actor_id)
inner join film f using(film_id)
order by a.actor_id, f.title;

/*
15.	The Manager from Store 2 is working on expanding our film collection there.
Could you pull a list of distinct titles and their descriptions, currently available in inventory at store 2?
*/
select distinct f.film_id, f.title, f.description
from inventory i
inner join film f using(film_id)
left join rental r on i.inventory_id = r.inventory_id and r.return_date is null
where i.store_id = 2 and r.inventory_id is null
order by f.title;


