-- questão 01
select * from customer;

-- questao 02
select first_name from customer;
select last_name from customer;

-- questao 03
select * from film
 where length > 120;
 
 -- questao 04
select * from film where release_year = 2006;

-- questao 05
select * from customer where active =1;

-- questao 06
select r.rental_id, r.rental_date, c.first_name, c.last_name from rental r
join customer c 
  on r.customer_id = c.customer_id;
  
  -- questao 07
  select p.payment_id, concat(c.first_name, ' ', c.last_name) as customer_name, p.amount from payment p
join customer c 
  on p.customer_id = c.customer_id;
  
  -- questao 08
  select f.title, concat(c.first_name, ' ', c.last_name) as customer_name, r.rental_date from rental r
join customer c 
  on r.customer_id = c.customer_id
join inventory i 
  on r.inventory_id = i.inventory_id
join film f 
  on i.film_id = f.film_id;
  
  -- questao 09
  select s.staff_id, s.first_name, s.last_name, st.store_id from staff s
join store st
  on s.store_id = st.store_id;
  
  -- questao 10
  select f.title, c.name as category from film f
join film_category fc 
  on f.film_id = fc.film_id
join category c 
  on fc.category_id = c.category_id;
  
  -- questao 11
  select count(*) as total_clientes from customer;
  
  -- questao 12
  select sum(amount) as total_pagamentos from payment;
  
  -- questao 13
  select avg(amount) as media_pagamentos from payment;
  
  -- questao 14
  select c.name as categoria,
       count(f.film_id) as total_filmes
from category c
join film_category fc 
  on c.category_id = fc.category_id
join film f 
  on fc.film_id = f.film_id
group by c.name;

-- questao 15
select c.customer_id,
       concat(c.first_name, ' ', c.last_name) as customer_name,
       count(r.rental_id) as total_alugueis
from customer c
join rental r 
  on c.customer_id = r.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_alugueis desc
limit 1;

-- questao 16
select c.customer_id,
       concat(c.first_name, ' ', c.last_name) as customer_name,
       sum(p.amount) as total_gasto
from customer c
join payment p 
  on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_gasto desc;

-- questao 17
select c.customer_id,
       concat(c.first_name, ' ', c.last_name) as customer_name,
       sum(p.amount) as total_gasto
from customer c
join payment p 
  on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_gasto desc
limit 5;

-- questao 18
select f.title,
       count(r.rental_id) as total_alugueis
from film f
join inventory i 
  on f.film_id = i.film_id
join rental r 
  on i.inventory_id = r.inventory_id
group by f.title
order by total_alugueis desc;

-- questao 19
select c.name as categoria,
       count(distinct f.film_id) as total_filmes,
       count(r.rental_id) as total_alugueis
from category c
join film_category fc 
  on c.category_id = fc.category_id
join film f 
  on fc.film_id = f.film_id
join inventory i 
  on f.film_id = i.film_id
join rental r 
  on i.inventory_id = r.inventory_id
group by c.name;

-- questao 20
select concat(c.first_name, ' ', c.last_name) as customer_name,
       f.title as filme,
       cat.name as categoria,
       p.amount as valor_pago
from customer c
join rental r 
  on c.customer_id = r.customer_id
join inventory i 
  on r.inventory_id = i.inventory_id
join film f 
  on i.film_id = f.film_id
join film_category fc 
  on f.film_id = fc.film_id
join category cat 
  on fc.category_id = cat.category_id
join payment p 
  on c.customer_id = p.customer_id;
