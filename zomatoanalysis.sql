use zomato;
show tables; 
select * from riders;

--Write an SQL query to fetch all details of customers who have made at least one order--
SELECT * 
FROM customerss 
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orderss);

--Find the number of orders each customer has placed.--
SELECT customer_id, COUNT(order_id) AS total_orders 
FROM orderss 
GROUP BY customer_id 
ORDER BY total_orders DESC;

--Fetch all orders where the total amount is greater than ₹500.--
SELECT * 
FROM orderss 
WHERE total_amount > 500;

--Retrieve the names of restaurants that have received at least 10 orders.--
SELECT r.restaurant_name, COUNT(o.order_id) AS total_orders
FROM orderss o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(o.order_id) >= 5;

--Fetch the top 5 riders with the highest average rating.--
SELECT rider_id, rider_name, average_rating 
FROM riders 
ORDER BY average_rating DESC 
LIMIT 5;

--Determine which cuisine type has the highest number of orders.--
SELECT r.cuisine_type, COUNT(o.order_id) AS total_orders
FROM orderss o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.cuisine_type
ORDER BY total_orders DESC
LIMIT 1;

--Find the total amount spent by each customer and rank them in descending order.--
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM orderss o
JOIN customerss c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

--Find out which payment mode is used the most.--  
SELECT payment_mode, COUNT(order_id) AS usage_count
FROM orderss
GROUP BY payment_mode
ORDER BY usage_count DESC
LIMIT 1;

--Calculate the average delivery time per rider and sort in ascending order.--
SELECT d.rider_id, r.rider_name, AVG(d.delivery_time) AS avg_delivery_time
FROM deliveries d
JOIN riders r ON d.rider_id = r.rider_id
WHERE d.delivery_status = 'Delivered'
GROUP BY d.rider_id, r.rider_name
ORDER BY avg_delivery_time ASC;

--Retrieve the top 5 restaurants with the highest average rating and at least 50 reviews.--
SELECT restaurant_name, average_rating, total_reviews
FROM restaurants
WHERE total_reviews >= 50
ORDER BY average_rating DESC
LIMIT 5;

--Find customers who have placed more than 20 orders and spent over ₹5000
SELECT c.customer_id, c.name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS total_spent
FROM orderss o
JOIN customerss c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 20 AND SUM(o.total_amount) > 5000;

--Identify deliveries that took more than 45 minutes and display the corresponding restaurant and rider details.--
SELECT d.delivery_id, d.order_id, d.delivery_time, r.rider_name, rest.restaurant_name
FROM deliveries d
JOIN riders r ON d.rider_id = r.rider_id
JOIN orderss o ON d.order_id = o.order_id
JOIN restaurants rest ON o.restaurant_id = rest.restaurant_id
WHERE d.delivery_time > 45;

--Compute the total revenue generated per month.--
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS total_revenue
FROM orderss
GROUP BY month
ORDER BY month;

--Find customers who placed their first order in January but did not order again in the last 3 months.--
SELECT customer_id, name
FROM customerss
WHERE customer_id IN (
    SELECT customer_id FROM orderss WHERE MONTH(order_date) = 1
)
AND customer_id NOT IN (
    SELECT customer_id FROM orderss WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
);

--Identify orders that were either "Pending" or "Cancelled" and list them along with customer and rider details.--
SELECT o.order_id, c.name AS customer_name, r.rider_name, o.order_status
FROM orderss o
JOIN deliveries d ON o.order_id = d.order_id
JOIN customerss c ON o.customer_id = c.customer_id
JOIN riders r ON d.rider_id = r.rider_id
WHERE o.order_status IN ('Pending', 'Cancelled');

--Find the restaurant with the highest total sales revenue.--
SELECT r.restaurant_name, SUM(o.total_amount) AS total_revenue
FROM orderss o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC
LIMIT 1;

--Compute the Average Order Value (AOV) by dividing the total sales by the number of orders.--
SELECT ROUND(SUM(total_amount) / COUNT(order_id), 2) AS average_order_value
FROM orderss;

--Identify the rider who has the shortest average delivery time and the rider with the longest.--
SELECT riders.rider_id, riders.rider_name, AVG(deliveries.delivery_time) AS avg_delivery_time
FROM deliveries
JOIN riders ON deliveries.rider_id = riders.rider_id
GROUP BY riders.rider_id, riders.rider_name
ORDER BY avg_delivery_time ASC
LIMIT 1;

SELECT riders.rider_id, riders.rider_name, AVG(deliveries.delivery_time) AS avg_delivery_time
FROM deliveries
JOIN riders ON deliveries.rider_id = riders.rider_id
GROUP BY riders.rider_id, riders.rider_name
ORDER BY avg_delivery_time desc
LIMIT 1;

--Identify potential fake orders where the total amount is high but the order was canceled multiple times.--
SELECT customer_id, COUNT(order_id) AS cancelled_orders, SUM(total_amount) AS total_spent
FROM orderss
WHERE order_status = 'Cancelled'
GROUP BY customer_id
HAVING COUNT(order_id) > 5 AND SUM(total_amount) > 1000 ;

-- Categorize customers into segments based on their total spending--

SELECT customerss.customer_id, customerss.name,  
     CASE  
         WHEN SUM(orderss.total_amount) > 10000 THEN 'High Value'  
         WHEN SUM(orderss.total_amount) BETWEEN 5000 AND 10000 THEN 'Medium Value'  
         ELSE 'Low Value'  
     END AS customer_segment  
FROM orderss  
JOIN customerss ON orderss.customer_id = customerss.customer_id  
GROUP BY customerss.customer_id, customerss.name  
LIMIT 1000;










