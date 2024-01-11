-- 1. List the number of films per category.
select count(fc.film_id) as "count", fc.category_id, c.name as "category_name"
from film_category fc
join category c
on fc.category_id = c.category_id
group by c.name,fc.category_id
order by count(fc.film_id) desc;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff s
join address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August 2005.

select s.first_name, sum(p.amount) as total_amount 
from sakila.staff as s
join sakila.payment as p
on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.first_name, s.last_name;

-- 4. List all films and the number of actors who are listed for each film.
select count(actor_id), film_id from film_actor group by film_id;
select * from film;

select count(a.actor_id) as "number_of_actors", f.title
from film_actor as a 
join film as f
on a.film_id = f.film_id
group by f.film_id;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from payment;
select * from customer;

select c.first_name, c.last_name, sum(p.amount) as "total"
from payment p
join customer c
on p.customer_id = c.customer_id
group by c.customer_id
order by last_name asc;