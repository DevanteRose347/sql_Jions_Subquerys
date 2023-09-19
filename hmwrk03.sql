--1. List all customers who live in Texas (use
--JOINs)
SELECT *
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT *
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99


3. Show all customers names who have made payments over $175(use
subqueries)

SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN ( -- this is the query within the query --
	SELECT customer_id
	FROM payment
	GROUP BY customer_ID
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

4. List all customers that live in Nepal (use the city
table)

SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
INNER JOIN city
ON city.city_id = address.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal'

5. Which staff member had the most
transactions?
SELECT *
FROM staff
INNER JOIN rental
ON rental.staff_id = staff.staff_id

6. How many movies of each rating are
there?
SELECT rating,Count(rating)
FROM film
Group By rating

7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in ( 
	SELECT Distinct(customer_id)
	FROM payment
	where amount > 6.99
)

8. How many free rentals did our stores give away?
Select rental_id
from payment
where amount < .001