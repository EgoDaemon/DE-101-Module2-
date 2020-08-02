select sum(profit),  extract ('year' from order_date) as год
from public.orders o
group by год
order by год asc;

select extract('month' from o.order_date) as месяц, sum(profit) as прибыль, count(order_id) as количество_заказов
from public.orders o
group by месяц
order by месяц asc;

select state, sum(sales), sum(profit), AVG(profit/sales) as доля_прибыли_от_продаж
from public.orders o
group by state
order by state asc;

select state, count(subcategory) as куплено_по_всем_под_категориям
from public.orders o 
group by state
order by state asc;

UPDATE orders
SET Person = (SELECT Person FROM people WHERE Region = 'West')
WHERE Region = 'West';
UPDATE orders
SET Person = (SELECT Person FROM people WHERE Region = 'East')
WHERE Region = 'East';
UPDATE orders
SET Person = (SELECT Person FROM people WHERE Region = 'Central')
WHERE Region = 'Central';
UPDATE orders
SET Person = (SELECT Person FROM people WHERE Region = 'South')
WHERE Region = 'South';

SELECT * FROM orders;

SELECT count(returned) FROM orders left Join returns USING(Order_id)
where returned is not Null
;

SELECT person as Менеджер, count(returned) as Количество_возвратов FROM orders left Join returns USING(Order_id)
where returned is not null
group by person
;

SELECT state, count(returned) as Количество_возвратов FROM orders left Join returns USING(Order_id)
where returned is not null
group by state
;

SELECT count(returned) as Количество_возвратов FROM orders left Join returns USING(Order_id)
where returned is not null;

select count(distinct (Order_id)) from orders left Join returns USING(Order_id)
where returned is not null;

select person, round((avg(Discount)*100), 2)  from orders o
where Discount <> 0
group by person;