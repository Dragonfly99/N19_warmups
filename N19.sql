With order_info As (SELECT SUM(order_date) as total
from customers
join orders
using (customer_id)
join order_details
using (order_id)
join products
using (product_id);
)

--I'm taking too long to figure out these 