USE sakila;

-- 1. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name)
FROM actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id)
FROM language;  -- I have used language table instead of film table.

-- 3. How many movies were released with "PG-13" rating?

SELECT COUNT(title)
FROM film
WHERE rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.

SELECT title, length, release_year
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?

select payment_date
FROM payment
ORDER BY payment_date desc;

SELECT datediff('2006-02-14', '2005-05-24') as total_operating_days
FROM payment;

-- 6. Show rental info with additional columns month and weekday. Get 20.

Select *, DATE_FORMAT(rental_date, "%M") as month, WEEKDAY(rental_date) AS weekday -- 0 = Monday, 1 = Tuesday, 2 = Wednesday, 3 = Thursday, 4 = Friday, 5 = Saturday, 6 = Sunday.
FROM rental
LIMIT 20;


-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR DAYNAME(rental_date)= "Sunday") THEN "weekend"
	ELSE "workday"
    END as day_type
from rental;

-- 8 How many rentals were in the last month of activity?

SELECT*
FROM rental
ORDER BY rental_date desc;

SELECT rental_id, DATE_FORMAT(rental_date,"%Y-%m-%d") as date_2, datediff("2006-02-14",DATE_FORMAT(rental_date,"%Y-%m-%d")) as date_3 
FROM rental
WHERE datediff("2006-02-14", DATE_FORMAT(rental_date,"%Y-%m-%d")) < 30;

-- OR??

SELECT rental_id, rental_date
from rental
WHERE rental_date BETWEEN '2006-02-14' AND '2006-01-14';