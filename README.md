  # README: Zomato Data Explorer
  
## Project Overview
Zomato Data Explorer is an SQL-based data analysis project that explores key insights from Zomato's business operations. The project utilizes five datasets—deliveries, riders, orders, restaurants, and customers—to analyze customer behavior, restaurant performance, delivery efficiency, and financial metrics. The project covers SQL queries ranging from basic data retrieval to complex aggregations and advanced analytics.

## Datasets Used
The project analyzes the following datasets:

Customers – Contains customer details.
Orders – Stores order transactions, amounts, and statuses.
Restaurants – Includes restaurant details such as name, cuisine, and ratings.
Riders – Contains information on delivery personnel, including ratings.
Deliveries – Logs delivery times and performance data.

## SQL Concepts Applied
This project demonstrates the following SQL techniques:

Basic Queries: Data retrieval using SELECT, WHERE, and ORDER BY.
Aggregations & Grouping: Using COUNT(), SUM(), AVG(), and GROUP BY.
Joins: Combining data across multiple tables using INNER JOIN, LEFT JOIN, etc.
Subqueries & CTEs: Handling complex queries using nested logic.
CASE Statements: Implementing conditional logic.
Window Functions: Using RANK(), DENSE_RANK(), and ROW_NUMBER().
Data Filtering & Optimization: Efficient querying with indexes and filtering.

## Key Insights & Queries Solved
The project is structured into different difficulty levels:

### Easy Level (Basic SQL Queries)
Retrieve customer details who have made at least one order.
Count total orders per customer.
Find all orders where the total amount exceeds ₹500.
Identify restaurants that have received at least 10 orders.
List the top 5 riders with the highest average ratings.
Medium Level (Joins & Aggregations)
Find the most popular cuisine based on the number of orders.
Analyze customer spending and rank them in descending order.
Identify the most frequently used payment method.
Calculate the average delivery time per rider.
Retrieve the top 5 restaurants with the highest average rating (with at least 50 reviews).

### Hard Level (Complex Queries & Case Statements)
Identify loyal customers (customers with over 20 orders and ₹10,000+ spent).
Detect late deliveries (orders that took more than 45 minutes).
Compute total monthly revenue.
Identify customer retention patterns (first order in January but no recent orders).
Find orders with delivery issues (pending or canceled orders).
Expert Level (Advanced SQL for Data Insights)
Find the most profitable restaurant based on total sales revenue.
Compute Average Order Value (AOV) as Total Sales / Number of Orders.
Identify the fastest and slowest rider based on average delivery time.
Detect potential fake orders (high order value with multiple cancellations).
Perform Dynamic Customer Segmentation based on spending behavior.

# How to Run the SQL Scripts
To execute the queries and analyze the data:

Setup the Database

Import all datasets into a relational database (MySQL, PostgreSQL, or SQL Server).
Ensure table structures match the required schema.
Run Queries

Open the SQL script in your database query editor.
Execute queries sequentially or modify them as needed.
Analyze Results

# Conclusion
This project provides valuable insights into customer behavior, restaurant performance, delivery efficiency, and sales trends in the Zomato ecosystem. With a structured SQL approach, it helps optimize food delivery operations and business decision-making.
