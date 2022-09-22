SELECT city.name as city, SUM(order_details.price_with_discount * order_details.product_amount) as income
FROM 
city INNER JOIN street ON city.id = street.city_id
INNER JOIN supermarket ON street.id = supermarket.street_id
INNER JOIN customer_order ON supermarket.id = customer_order.supermarket_id
INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
WHERE  customer_order.operation_time BETWEEN "2020-11-01" AND "2020-11-30"
GROUP BY city.name
ORDER BY income