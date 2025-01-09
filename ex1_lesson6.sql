use sakila;

select count(actor_id) from actor;

select min(length) as min_length, max(length) as max_lenght from film;

select COUNT(rating) 
from film
where rating = 'R';

select avg(rental_rate) from film
where length > 60;

