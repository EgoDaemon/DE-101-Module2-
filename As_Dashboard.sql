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

