

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration_minutes INT,
    language VARCHAR(50),
    rating DECIMAL(2,1)
);
INSERT INTO movies VALUES 
(1, 'Inception', 'Sci-Fi', 148, 'English', 8.8),
(2, '3 Idiots', 'Comedy', 170, 'Hindi', 8.4),
(3, 'Interstellar', 'Sci-Fi', 169, 'English', 8.6),
(4, 'Bahubali', 'Action', 159, 'Telugu', 8.0),
(5, 'KGF', 'Action', 155, 'Kannada', 8.2),
(6, 'Dangal', 'Drama', 161, 'Hindi', 8.5),
(7, 'Titanic', 'Romance', 195, 'English', 7.8),
(8, 'Vikram', 'Action', 174, 'Tamil', 8.4),
(9, 'The Dark Knight', 'Action', 152, 'English', 9.0),
(10, 'Drishyam', 'Thriller', 163, 'Hindi', 8.3);
select * from movies;
CREATE TABLE theaters (
    theater_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);
INSERT INTO theaters VALUES 
(1, 'PVR Cinemas', 'Chennai'),
(2, 'INOX', 'Bangalore'),
(3, 'SPI Cinemas', 'Hyderabad'),
(4, 'Cinepolis', 'Mumbai'),
(5, 'AGS Cinemas', 'Coimbatore'),
(6, 'Escape Cinemas', 'Chennai'),
(7, 'Carnival Cinemas', 'Delhi'),
(8, 'Sathyam Cinemas', 'Chennai'),
(9, 'INOX', 'Pune'),
(10, 'Miraj Cinemas', 'Kolkata');
select * from theaters;
drop table theaters;

CREATE TABLE screens (
    screen_id INT PRIMARY KEY,
    theater_id INT,
    screen_number INT,
    capacity INT,
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);
INSERT INTO screens VALUES 
(1, 1, 1, 120),
(2, 1, 2, 100),
(3, 2, 1, 80),
(4, 2, 2, 90),
(5, 3, 1, 110),
(6, 4, 1, 130),
(7, 5, 1, 85),
(8, 6, 1, 150),
(9, 7, 1, 75),
(10, 8, 1, 140);
select * from screens;

CREATE TABLE showtimes (
    show_id INT PRIMARY KEY,
    screen_id INT,
    movie_id INT,
    show_date DATE,
    show_time TIME,
    price DECIMAL(6,2),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
INSERT INTO showtimes VALUES 
(1, 1, 1, '2025-06-22', '18:00', 250.00),
(2, 2, 2, '2025-06-22', '21:00', 200.00),
(3, 3, 3, '2025-06-23', '19:00', 230.00),
(4, 4, 4, '2025-06-23', '16:00', 180.00),
(5, 5, 5, '2025-06-24', '20:00', 220.00),
(6, 6, 6, '2025-06-24', '15:30', 210.00),
(7, 7, 7, '2025-06-25', '18:45', 240.00),
(8, 8, 8, '2025-06-25', '20:00', 260.00),
(9, 9, 9, '2025-06-26', '22:00', 250.00),
(10, 10, 10, '2025-06-26', '17:00', 200.00);
select * from showtimes;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO customers VALUES 
(1, 'Rahul Sharma', 'rahul@example.com', '9876543210'),
(2, 'Priya Iyer', 'priya@example.com', '9123456789'),
(3, 'Arjun Reddy', 'arjun@example.com', '9988776655'),
(4, 'Samantha K', 'sam@example.com', '9090909090'),
(5, 'Karthik Kumar', 'karthik@example.com', '9797979797'),
(6, 'Anjali Rao', 'anjali@example.com', '9666666666'),
(7, 'Vikram Das', 'vikram@example.com', '9555555555'),
(8, 'Meera Nair', 'meera@example.com', '9444444444'),
(9, 'Harsha V', 'harsha@example.com', '9333333333'),
(10, 'Swathi P', 'swathi@example.com', '9222222222');
select * from customers;
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    show_id INT,
    booking_date DATE,
    seats_booked INT,
    total_amount DECIMAL(8,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES showtimes(show_id)
);
INSERT INTO bookings VALUES 
(1, 1, 1, DEFAULT, 2, 500.00),
(2, 2, 2, DEFAULT, 1, 200.00),
(3, 3, 3, DEFAULT, 3, 690.00),
(4, 4, 4, DEFAULT, 2, 360.00),
(5, 5, 5, DEFAULT, 1, 220.00),
(6, 6, 6, DEFAULT, 4, 840.00),
(7, 7, 7, DEFAULT, 1, 240.00),
(8, 8, 8, DEFAULT, 2, 520.00),
(9, 9, 9, DEFAULT, 3, 750.00),
(10, 10, 10, DEFAULT, 2, 400.00);
SELECT * FROM  BOOKINGS;

CREATE TABLE seats (
    seat_id INT PRIMARY KEY,
    screen_id INT,
    seat_number VARCHAR(10),
    seat_type VARCHAR(20),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id)
);
INSERT INTO seats (seat_id, screen_id, seat_number, seat_type) VALUES
(1, 1, 'A1', 'Regular'),
(2, 1, 'A2', 'Regular'),
(3, 1, 'A3', 'Regular'),
(4, 1, 'A4', 'Regular'),
(5, 1, 'A5', 'Regular'),
(6, 1, 'B1', 'Premium'),
(7, 1, 'B2', 'Premium'),
(8, 1, 'B3', 'Premium'),
(9, 1, 'C1', 'VIP'),
(10, 1, 'C2', 'VIP');
select * from seats;

DROP TABLE booked_seats;
CREATE TABLE booked_seats (
    booked_seat_id INT PRIMARY KEY,
    booking_id INT,
    seat_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)

);
INSERT INTO booked_seats (booked_seat_id, booking_id, seat_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
SELECT * FROM booked_seats;
-- queries

SELECT * FROM movies;



SELECT * FROM theaters WHERE location = 'Chennai';


SELECT * FROM bookings WHERE seats_booked > 2;



SELECT m.title, st.show_date, st.show_time, t.name AS theater
FROM showtimes st
JOIN movies m ON st.movie_id = m.movie_id
JOIN screens sc ON st.screen_id = sc.screen_id
JOIN theaters t ON sc.theater_id = t.theater_id;





SELECT b.booking_id, c.name AS customer, m.title AS movie, b.seats_booked
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN showtimes st ON b.show_id = st.show_id
JOIN movies m ON st.movie_id = m.movie_id;




SELECT m.title, COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN showtimes st ON b.show_id = st.show_id
JOIN movies m ON st.movie_id = m.movie_id
GROUP BY m.title;





SELECT t.name AS theater, SUM(b.total_amount) AS revenue
FROM bookings b
JOIN showtimes st ON b.show_id = st.show_id
JOIN screens s ON st.screen_id = s.screen_id
JOIN theaters t ON s.theater_id = t.theater_id
GROUP BY t.name;








SELECT DISTINCT c.name
FROM customers c
JOIN bookings b ON c.customer_id = b.customer_id
WHERE b.show_id IN (
    SELECT show_id FROM showtimes
    WHERE movie_id IN (
        SELECT movie_id FROM movies WHERE rating > 8.5)
);





SELECT * FROM movies ORDER BY rating DESC LIMIT 5;







SELECT * FROM bookings ORDER BY booking_date DESC LIMIT 3;











DELIMITER $$

CREATE TRIGGER prevent_overbooking
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
    DECLARE total_booked INT;
    DECLARE capacity_limit INT;

    SELECT SUM(seats_booked) INTO total_booked
    FROM bookings
    WHERE show_id = NEW.show_id;

    SELECT capacity INTO capacity_limit
    FROM screens
    WHERE screen_id = (
        SELECT screen_id FROM showtimes WHERE show_id = NEW.show_id
    );

    IF (total_booked + NEW.seats_booked) > capacity_limit THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking exceeds available seats!';
    END IF;
END$$;

DELIMITER ;






--------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE GetMovieShows(IN in_movie_id INT)
BEGIN
    SELECT s.show_id, t.name AS theater, s.show_date, s.show_time, s.price
    FROM showtimes s
    JOIN screens sc ON s.screen_id = sc.screen_id
    JOIN theaters t ON sc.theater_id = t.theater_id
    WHERE s.movie_id = in_movie_id;
END$$;

DELIMITER ;
CALL GetMovieShows(7);







DELIMITER $$
CREATE PROCEDURE ShowAvailableSeats(IN in_show_id INT)
BEGIN
    SELECT s.seat_id, s.seat_number, s.seat_type
    FROM seats s
    WHERE s.screen_id = (
        SELECT screen_id FROM showtimes WHERE show_id = in_show_id
    )
    AND s.seat_id NOT IN (
        SELECT seat_id FROM booked_seats
        WHERE booking_id IN (
            SELECT booking_id FROM bookings WHERE show_id = in_show_id
        )
    );
END$$;
DELIMITER ;
CALL ShowAvailableSeats(1);







########################################################################
DELIMITER $$

CREATE FUNCTION get_show_price(in_show_id INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    DECLARE price DECIMAL(6,2);
    SELECT price INTO price FROM showtimes WHERE show_id = in_show_id;
    RETURN price;
END$$;

DELIMITER ;
SELECT get_show_price(4);




UPDATE showtimes
SET price = 275.00
WHERE show_id = 1;
SELECT * FROM SHOWTIMES;




DELETE FROM bookings
WHERE booking_id = 11;
SELECT * FROM BOOKINGS;





INSERT INTO movies (movie_id, title, genre, duration_minutes, language, rating)
VALUES (12,'DROGON','COMMERCIAL', 160, 'Tamil', 8.1);
SELECT * FROM MOVIES;























