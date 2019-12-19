with top_3 as (SELECT c.customer_id, country, MAX(order_date) - MIN(order_date) as diff, RANK() OVER(Partition by country order by MAX(order_date) - MIN(order_date)  desc) de_rank
from customers as c
join orders
using (customer_id)
join order_details
using (order_id)
join products
using (product_id)
group by c.customer_id
)
select *
from top_3
where de_rank <=3;

--I'm taking too long to figure out these 
-- No longer the case