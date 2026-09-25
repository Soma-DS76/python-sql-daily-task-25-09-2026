CREATE VIEW monthly_performance AS
    SELECT DATE_FORMAT(s.sale_date,'%Y-%m') AS month, COUNT(s.sale_id) AS total_sales,
                    SUM(s.quantity) AS total_quantity, SUM(s.quantity * p.price) AS total_revenue
    FROM sales s
    INNER JOIN products p
    ON s.product_id = p.product_id
    GROUP BY DATE_FORMAT(s.sale_date,'%Y-%m');

SELECT * FROM monthly_performance;