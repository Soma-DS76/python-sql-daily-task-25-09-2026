CREATE TABLE products( product_id INT PRIMARY KEY, product_name VARCHAR(100) NOT NULL,
                       price DECIMAL(10,2) NOT NULL );

CREATE TABLE sales( sale_id INT PRIMARY KEY AUTO_INCREMENT, product_id INT NOT NULL, 
                    quantity INT NOT NULL, sale_date DATE NOT NULL, 
                    FOREIGN KEY(product_id) REFERENCES products(product_id) );

INSERT INTO products
VALUES (1,'Laptop',50000), (2,'Mobile',20000), (3,'Keyboard',1500), (4,'Mouse',800);

INSERT INTO sales(product_id,quantity,sale_date)
VALUES (1,2,'2026-09-01'), (2,5,'2026-09-05'), (3,10,'2026-09-10'), (1,1,'2026-09-15'), (4,15,'2026-09-20');

SELECT product_id,product_name,price
FROM products
WHERE product_id IN( SELECT product_id FROM sales );

SELECT product_id,product_name,price
FROM products
WHERE product_id NOT IN( SELECT product_id FROM sales );

SELECT product_id,product_name,price
FROM products
WHERE product_id =( SELECT product_id 
                    FROM sales 
                    GROUP BY product_id 
                    ORDER BY SUM(quantity) 
                    DESC LIMIT 1 );

SELECT product_id,product_name,price
FROM products
WHERE price >( SELECT AVG(price) FROM products );