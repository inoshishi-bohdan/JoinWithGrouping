SELECT surname, name, birth_date, SUM(price * product_amount) as sum
FROM
person INNER JOIN customer ON person.id = customer.person_id
INNER JOIN customer_order ON customer.person_id = customer_order.customer_id
INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
WHERE (operation_time BETWEEN "2021-01-01" AND "2021-12-31") AND discount = 0
GROUP BY person.id
ORDER BY sum