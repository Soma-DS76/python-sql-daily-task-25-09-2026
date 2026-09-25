CREATE DATABASE movie_booking_db;

USE movie_booking_db;

CREATE TABLE movies( movie_id INT PRIMARY KEY AUTO_INCREMENT, movie_name VARCHAR(100) NOT NULL,
                     language VARCHAR(50) NOT NULL,duration INT NOT NULL );

CREATE TABLE theaters( theater_id INT PRIMARY KEY AUTO_INCREMENT, theater_name VARCHAR(100) NOT NULL,
                       location VARCHAR(100) NOT NULL);

CREATE TABLE shows( show_id INT PRIMARY KEY AUTO_INCREMENT, movie_id INT NOT NULL, theater_id INT NOT NULL,
                    show_date DATE NOT NULL, show_time TIME NOT NULL, ticket_price DECIMAL(10,2) NOT NULL,
                    FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
                    FOREIGN KEY(theater_id) REFERENCES theaters(theater_id) );

CREATE TABLE customers( customer_id INT PRIMARY KEY AUTO_INCREMENT, customer_name VARCHAR(100) NOT NULL,
                        phone VARCHAR(15) NOT NULL, email VARCHAR(100) );

CREATE TABLE bookings(  booking_id INT PRIMARY KEY AUTO_INCREMENT, customer_id INT NOT NULL,
                        show_id INT NOT NULL, seats INT NOT NULL, total_amount DECIMAL(10,2) NOT NULL,
                        booking_date DATE NOT NULL, FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
                        FOREIGN KEY(show_id) REFERENCES shows(show_id) );

INSERT INTO movies(movie_name,language,duration)
VALUES ('KGF','Kannada',168), ('Kantara','Kannada',148), ('RRR','Telugu',182);

INSERT INTO theaters(theater_name,location)
VALUES ('PVR Cinemas','Bengaluru'), ('INOX','Bengaluru');

INSERT INTO customers(customer_name,phone,email) 
VALUES ('Ravi','9876543210','ravi@gmail.com'), ('Kiran','9876543211','kiran@gmail.com');

INSERT INTO shows(movie_id,theater_id,show_date,show_time,ticket_price)
VALUES (1,1,'2026-09-25','10:00:00',200), (2,1,'2026-09-25','14:00:00',250), (3,2,'2026-09-25','18:00:00',300);

INSERT INTO bookings(customer_id,show_id,seats,total_amount,booking_date)
VALUES (1,1,2,400,'2026-09-25'), (2,2,3,750,'2026-09-25');