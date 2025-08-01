
CREATE DATABASE POLICY;
USE POLICY;
CREATE TABLE vehicle_make (
    make_id INT PRIMARY KEY,
    make_desc VARCHAR(50) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE,
    added_by VARCHAR(50)
);
INSERT INTO vehicle_make VALUES
(1, 'Honda', 'active', '2010-09-09', 'admin'),
(2, 'Hyundai', 'active','2015-08-07', 'admin'),
(3, 'Suzuki', 'active', '2013-08-09', 'admin'),
(4, 'Toyota', 'active', '2015-01-02', 'admin'),
(5, 'Tata', 'active', '2009-08-06', 'admin'),
(6, 'Ford', 'active', '2015-08-05', 'admin'),
(7, 'Chevrolet', 'inactive','2013-01-12','admin'),
(8, 'BMW', 'active', '2009-10-10','admin'),
(9, 'KTM', 'active', '2010-11-11','admin'),
(10, 'Yamaha', 'active', '2018-06-07','admin');
use policy;
select * from vehicle_make;

CREATE TABLE vehicle_model (
    model_id INT PRIMARY KEY,
    model_desc VARCHAR(50) NOT NULL,
    make_id INT,
    status VARCHAR(10) NOT NULL,
    added_on DATE DEFAULT "2020-03-20",
    added_by VARCHAR(50),
    FOREIGN KEY (make_id) REFERENCES vehicle_make(make_id)
);
desc vehicle_model;
INSERT INTO vehicle_model VALUES
(1, 'Activa 6G', 1, 'active',"2019-11-10",'admin'),
(2, 'Creta', 2, 'active', "2019-11-10",'admin'),
(3, 'Swift', 3, 'active',"2019-11-10", 'admin'),
(4, 'Fortuner', 4, 'active',"2019-11-10",'admin'),
(5, 'Nexon', 5, 'active',"2019-11-10",'admin'),
(6, 'EcoSport', 6, 'active', "2019-11-10",'admin'),
(7, 'Cruze', 7, 'inactive',"2019-11-10", 'admin'),
(8, 'X5', 8, 'active',"2019-11-10",'admin'),
(9, 'Duke 200', 9, 'active',"2019-11-10",'admin'),
(10, 'FZ V3', 10, 'active',"2019-11-10",'admin');
select * from vehicle_model;

CREATE TABLE personal_info (
    user_id INT PRIMARY KEY,
    usertype VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    marital_status VARCHAR(30),
    education VARCHAR(30),
    mobile VARCHAR(15),
    addr1 VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(30),
    state VARCHAR(50) DEFAULT 'tamilnadu',
    country VARCHAR(50) DEFAULT 'india',
    status VARCHAR(10) NOT NULL,
    added_on DATE DEFAULT '2020-02-09',
    added_by VARCHAR(50)
);
INSERT INTO personal_info (user_id, usertype, first_name, last_name, gender, dob, email, marital_status, education, mobile, addr1, street, city, state, country, status, added_on, added_by)
VALUES 
(1, 'customer', 'Ravi', 'Kumar', 'Male', '1990-05-20', 'ravi.kumar@example.com', 'Single', 'Graduate', '9876543210', '12A', 'Main Street', 'Chennai', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(2, 'broker', 'Sita', 'Devi', 'Female', '1985-07-15', 'sita.devi@example.com', 'Married', 'Postgraduate', '9876543211', '45B', 'Park Road', 'Coimbatore', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(3, 'customer', 'Arun', 'Raj', 'Male', '1992-11-30', 'arun.raj@example.com', 'Single', 'Graduate', '9876543212', '67C', 'Lake View', 'Madurai', 'Tamilnadu', 'India', 'inactive', '2020-02-09', 'admin'),
(4, 'broker', 'Priya', 'Sharma', 'Female', '1988-03-25', 'priya.sharma@example.com', 'Married', 'Graduate', '9876543213', '89D', 'Market Road', 'Trichy', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(5, 'customer', 'Karthik', 'M', 'Male', '1995-01-10', 'karthik.m@example.com', 'Single', 'Diploma', '9876543214', '23E', 'College Road', 'Salem', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(6, 'broker', 'Meena', 'Lakshmi', 'Female', '1980-09-12', 'meena.lakshmi@example.com', 'Married', 'Postgraduate', '9876543215', '56F', 'Station Road', 'Erode', 'Tamilnadu', 'India', 'inactive', '2020-02-09', 'admin'),
(7, 'customer', 'Surya', 'V', 'Male', '1993-08-08', 'surya.v@example.com', 'Single', 'Graduate', '9876543216', '78G', 'Green Park', 'Vellore', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(8, 'broker', 'Lakshmi', 'Menon', 'Female', '1982-04-18', 'lakshmi.menon@example.com', 'Married', 'Graduate', '9876543217', '91H', 'Sun Street', 'Tirunelveli', 'Tamilnadu', 'India', 'inactive', '2020-02-09', 'admin'),
(9, 'customer', 'Naveen', 'K', 'Male', '1991-02-22', 'naveen.k@example.com', 'Single', 'Graduate', '9876543218', '34I', 'River Road', 'Thoothukudi', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin'),
(10, 'broker', 'Anitha', 'R', 'Female', '1987-12-05', 'anitha.r@example.com', 'Married', 'Postgraduate', '9876543219', '11J', 'Hill Side', 'Nagercoil', 'Tamilnadu', 'India', 'active', '2020-02-09', 'admin');
select * from personal_info;

CREATE TABLE login_user (
    login_id INT PRIMARY KEY,
    password VARCHAR(100),
    user_id INT,
    lead_id INT,
    usertype VARCHAR(20) NOT NULL,
    status VARCHAR(10) NOT NULL,
    added_on DATE DEFAULT '2020-10-10',
    added_by VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES personal_info(user_id)
);
INSERT INTO login_user (login_id, password, user_id, lead_id, usertype, status, added_on, added_by) VALUES
(1, 'encrypted123', 1, 4, 'User', 'active','2020-03-20','admin'),
(2, 'encrypted234', 2, 3, 'Broker', 'active','2020-03-20','admin'),
(3, 'encrypted345', 3, 2, 'User', 'active','2020-03-20','admin'),
(4, 'encrypted456', 4, 2, 'User', 'active','2020-03-20', 'admin'),
(5, 'encrypted567', 5, 2, 'SalesAgent', 'active','2020-03-20', 'admin'),
(6, 'encrypted678', 6, 4, 'User', 'active','2020-03-20', 'admin'),
(7, 'encrypted789', 7, 9, 'Broker', 'active','2020-03-20', 'admin'),
(8, 'encrypted890', 8, 7, 'User', 'active','2020-03-20', 'admin'),
(9, 'encrypted901', 9, 7, 'User', 'inactive','2020-03-20','admin'),
(10, 'encrypted012', 10, 2, 'SalesAgent', 'active','2020-03-20', 'admin');
select * from login_user;

CREATE TABLE broker_info (
    broker_id INT PRIMARY KEY,
    broker_name VARCHAR(100),
    broker_org_name VARCHAR(100),
    address_line1 VARCHAR(100),
    address_line2 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    contact_no VARCHAR(15),
    email VARCHAR(100),
    status VARCHAR(10) NOT NULL,
    added_on DATE DEFAULT ('2020-03-20'),
    added_by VARCHAR(50)
);
select * from broker_info;
INSERT INTO broker_info VALUES
(6, 'Devi', 'Sita Brokers Pvt Ltd', '123 Main St', '', 'Delhi', 'Delhi', '9876543210', 'sita@brokers.com', 'active','2020-03-03', 'admin'),
(7, 'Kiran Patel', 'Patel Insurance', '22 Link Road', '2nd Floor', 'Mumbai', 'Maharashtra', '8765432109', 'kiran@patel.com', 'active','2020-03-03', 'admin'),
(11, 'Rahul Nair', 'Nair Brokers', '45 Market Road', '', 'Kochi', 'Kerala', '7654321098', 'rahul@nair.com', 'active','2020-03-03', 'admin'),
(12, 'Meena Shah', 'Shah Insure Ltd', '11 Hill View', '', 'Ahmedabad', 'Gujarat', '6543210987', 'meena@shah.com', 'active','2020-03-03','admin'),
(13, 'Arvind Rao', 'Rao Secure', '5A West End', '', 'Bangalore', 'Karnataka', '5432109876', 'arvind@rao.com', 'active','2020-03-03','admin'),
(14, 'Devika R', 'D Secure', 'Building 7', '', 'Chennai', 'Tamil Nadu', '4321098765', 'devika@dsecure.com', 'inactive','2020-03-03', 'admin'),
(15, 'Gopi Krishnan', 'GK Covers', '3 East Lane', '', 'Hyderabad', 'Telangana', '3210987654', 'gopi@gk.com', 'active','2020-03-03','admin'),
(16, 'Nisha P', 'NP Associates', '98 Sunset Ave', '', 'Pune', 'Maharashtra', '2109876543', 'nisha@np.com', 'active','2020-03-03','admin'),
(17, 'Mahesh Y', 'Yadav Insure', 'Apt 12', '', 'Jaipur', 'Rajasthan', '1098765432', 'mahesh@yadav.com', 'active','2020-03-03', 'admin'),
(18, 'Sundar M', 'SM Protectors', 'Block D', '', 'Coimbatore', 'Tamil Nadu', '9988776655', 'sundar@sm.com', 'active','2020-03-03','admin');

select * from broker_info;
CREATE TABLE quote_info (
    quote_id INT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    cover_type VARCHAR(50),
    add_on_cover VARCHAR(100),
    base_premium DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_premium DECIMAL(10,2),
    quote_status VARCHAR(20),
    created_on DATE default'2021-09-08',
    FOREIGN KEY (user_id) REFERENCES personal_info(user_id)
);

INSERT INTO quote_info VALUES
(1, 1, 101, 'Comprehensive', 'Nil Depreciation', 6000.00, 1080.00, 7080.00, 'generated', CURRENT_DATE),
(2, 3, 102, 'Third Party', 'None', 3000.00, 540.00, 3540.00, 'generated', CURRENT_DATE),
(3, 4, 103, 'Comprehensive', 'Roadside Assistance', 5000.00, 900.00, 5900.00, 'generated', CURRENT_DATE),
(4, 5, 104, 'Comprehensive', 'Nil Depreciation + RSA', 7500.00, 1350.00, 8850.00, 'generated', CURRENT_DATE),
(5, 6, 105, 'Third Party', 'None', 2800.00, 504.00, 3304.00, 'generated', CURRENT_DATE),
(6, 8, 106, 'Comprehensive', 'Engine Protect', 8200.00, 1476.00, 9676.00, 'generated', CURRENT_DATE),
(7, 9, 107, 'Third Party', 'None', 2500.00, 450.00, 2950.00, 'generated', CURRENT_DATE),
(8, 10, 108, 'Comprehensive', 'RSA', 6400.00, 1152.00, 7552.00, 'generated', CURRENT_DATE),
(9, 1, 109, 'Comprehensive', 'Key Loss', 6800.00, 1224.00, 8024.00, 'generated', CURRENT_DATE),
(10, 2, 110, 'Third Party', 'None', 2600.00, 468.00, 3068.00, 'generated', CURRENT_DATE);

select * from quote_info;

CREATE TABLE premium_config (
    config_id INT PRIMARY KEY,
    vehicle_category VARCHAR(50),
    product_type VARCHAR(50),
    base_rate DECIMAL(10,2),
    tax_rate DECIMAL(5,2),
    effective_from DATE,
    status VARCHAR(10) NOT NULL
);
INSERT INTO premium_config VALUES
(1, 'Private', 'Comprehensive', 5500.00, 18.00, '2025-01-01', 'active'),
(2, 'Commercial', 'Comprehensive', 7000.00, 18.00, '2025-01-01', 'active'),
(3, 'Taxi', 'TPL', 3200.00, 18.00, '2025-01-01', 'active'),
(4, 'Motorcycle', 'Comprehensive', 4000.00, 18.00, '2025-01-01', 'active'),
(5, 'Private', 'TPL', 2800.00, 18.00, '2025-01-01', 'active'),
(6, 'Truck', 'Comprehensive', 10000.00, 18.00, '2025-01-01', 'active'),
(7, 'Bus', 'TPL', 6000.00, 18.00, '2025-01-01', 'active'),
(8, 'Van', 'Comprehensive', 6200.00, 18.00, '2025-01-01', 'active'),
(9, 'Sports', 'Comprehensive', 12000.00, 18.00, '2025-01-01', 'active'),
(10, 'Private', 'Comprehensive', 5700.00, 18.00, '2025-01-01', 'active');  

select * from broker_info;
CREATE TABLE broker_user_info (
    broker_user_id INT PRIMARY KEY,
    broker_id INT,
    user_id INT,
    joining_date DATE,
    branch_location VARCHAR(100),
    FOREIGN KEY (broker_id) REFERENCES broker_info(broker_id),
    FOREIGN KEY (user_id) REFERENCES personal_info(user_id)
);

INSERT INTO broker_user_info (broker_user_id, broker_id, user_id, joining_date, branch_location) VALUES
(1, 2, 2, '2023-01-10', 'Chennai'),
(2, 7, 7, '2023-02-12', 'Mumbai'),
(3, 11, 3, '2023-03-15', 'Delhi'),
(4, 12, 4, '2023-04-18', 'Hyderabad'),
(5, 13, 5, '2023-05-20', 'Bangalore'),
(6, 14, 6, '2023-06-22', 'Pune'),
(7, 15, 8, '2023-07-25', 'Ahmedabad'),
(8, 16, 9, '2023-08-28', 'Kolkata'),
(9, 17, 10, '2023-09-30', 'Jaipur'),
(10, 18, 1, '2023-10-01', 'Coimbatore');

select * from lov_master;
CREATE TABLE premium_rate_config (
    rate_id INT PRIMARY KEY,
    product_type VARCHAR(50),
    vehicle_category VARCHAR(50),
    base_rate DECIMAL(10,2),
    gst_percent DECIMAL(5,2),
    effective_from DATE
);

INSERT INTO premium_rate_config VALUES
(1, 'Comprehensive', 'Private', 5500.00, 18.00, '2024-01-01'),
(2, 'Comprehensive', 'Commercial', 7500.00, 18.00, '2024-01-01'),
(3, 'Third Party', 'Taxi', 3200.00, 18.00, '2024-01-01'),
(4, 'Comprehensive', 'Motorcycle', 4200.00, 18.00, '2024-01-01'),
(5, 'Third Party', 'Private', 2900.00, 18.00, '2024-01-01'),
(6, 'Comprehensive', 'Truck', 9500.00, 18.00, '2024-01-01'),
(7, 'Third Party', 'Bus', 6400.00, 18.00, '2024-01-01'),
(8, 'Comprehensive', 'Van', 6300.00, 18.00, '2024-01-01'),
(9, 'Comprehensive', 'Sports', 12500.00, 18.00, '2024-01-01'),
(10, 'Comprehensive', 'Private', 5650.00, 18.00, '2024-01-01');

select* from premium_rate_config;
CREATE TABLE quote_info_captured (
    quote_id INT PRIMARY KEY,
    user_id INT,
    vehicle_id INT,
    cover_type VARCHAR(50),
    duration INT,
    additional_coverage VARCHAR(100),
    created_on DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (user_id) REFERENCES personal_info(user_id)
);
INSERT INTO quote_info_captured VALUES
(101, 1, 101, 'Comprehensive', 1, 'Nil Depreciation','2023-10-11'),
(102, 2, 102, 'Third Party', 1, NULL,'2023-10-11'),
(103, 3, 103, 'Comprehensive', 2, 'Roadside Assistance','2023-10-11'),
(104, 4, 104, 'Comprehensive', 1, 'Nil Depreciation + RSA','2023-10-11'),
(105, 5, 105, 'Third Party', 1, NULL,'2023-10-11'),
(106, 6, 106, 'Comprehensive', 3, 'Engine Protect','2023-10-11'),
(107, 7, 107, 'Third Party', 1, NULL,'2023-10-11'),
(108, 8, 108, 'Comprehensive', 2, 'RSA','2023-10-11'),
(109, 9, 109, 'Comprehensive', 1, 'Key Loss','2023-10-11'),
(110, 10, 110, 'Third Party', 1, NULL,'2023-10-11');
select * from quote_info_captured;
CREATE TABLE broker_commission (
    commission_id INT PRIMARY KEY,
    broker_id INT,
    product_type VARCHAR(50),
    coverage_type VARCHAR(50),
    commission_percent DECIMAL(5,2),
    effective_date DATE,
    FOREIGN KEY (broker_id) REFERENCES broker_info(broker_id)
);
INSERT INTO broker_commission VALUES
(1, 2, 'Comprehensive', 'Standard', 10.00, '2024-01-01'),
(2, 7, 'Comprehensive', 'Premium', 12.50, '2024-01-01'),
(3, 11, 'Third Party', 'Standard', 5.00, '2024-01-01'),
(4, 12, 'Comprehensive', 'Add-on', 15.00, '2024-01-01'),
(5, 13, 'Comprehensive', 'Standard', 11.00, '2024-01-01'),
(6, 14, 'Third Party', 'Standard', 6.50, '2024-01-01'),
(7, 15, 'Comprehensive', 'Premium', 13.00, '2024-01-01'),
(8, 16, 'Comprehensive', 'Standard', 10.50, '2024-01-01'),
(9, 17, 'Third Party', 'Standard', 5.75, '2024-01-01'),
(10, 18, 'Comprehensive', 'Add-on', 14.25, '2024-01-01');

select * from broker_commission;
CREATE TABLE premium_calculated (
    premium_id INT PRIMARY KEY,
    quote_id INT,
    base_amount DECIMAL(10,2),
    gst_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    currency VARCHAR(10),
    calculated_on DATE,
    FOREIGN KEY (quote_id) REFERENCES quote_info_captured(quote_id)
);
INSERT INTO premium_calculated VALUES
(1, 101, 5500.00, 990.00, 6490.00, 'INR', CURRENT_DATE),
(2, 102, 2900.00, 522.00, 3422.00, 'INR', CURRENT_DATE),
(3, 103, 7500.00, 1350.00, 8850.00, 'INR', CURRENT_DATE),
(4, 104, 9000.00, 1620.00, 10620.00, 'INR', CURRENT_DATE),
(5, 105, 3000.00, 540.00, 3540.00, 'INR', CURRENT_DATE),
(6, 106, 9800.00, 1764.00, 11564.00, 'INR', CURRENT_DATE),
(7, 107, 2800.00, 504.00, 3304.00, 'INR', CURRENT_DATE),
(8, 108, 6900.00, 1242.00, 8142.00, 'INR', CURRENT_DATE),
(9, 109, 5800.00, 1044.00, 6844.00, 'INR', CURRENT_DATE),
(10, 110, 3100.00, 558.00, 3658.00, 'INR', CURRENT_DATE);
select * from premium_calculated;
show tables;
USE POLICY;
select * from broker_commission;
select * from broker_info;
SELECT 
    broker_commission.BROKER_ID,
    broker_commission.commission_id,
    broker_commission.product_type,
    broker_commission.coverage_type,
    broker_commission.commission_percent,
    broker_commission.effective_date,
    broker_info.broker_name
FROM
    broker_commission
        JOIN
    broker_info ON broker_commission.broker_id = broker_info.broker_id;
select * from personal_info; 
select * from personal_info where dob between '1985-01-01' and '1995-12-11';

select * from quote_info order by total_premium desc limit 5;
SELECT 
    product_type, AVG(base_rate) AS avg_base
FROM
    premium_config
GROUP BY product_type;
select avg(commission_percent) from broker_commission;

SELECT 
    *
FROM
    broker_commission
WHERE
    commission_percent > (SELECT 
            AVG(commission_percent)
        FROM
            broker_commission);
            
            
update personal_info set status ='inactive' where user_id =3;
DELIMITER //
CREATE PROCEDURE GetQuotesByUser (
    IN p_user_id INT
)
BEGIN
    SELECT * FROM quote_info
    WHERE user_id = p_user_id;
END;
//

DELIMITER ;
call GetQuotesByUser(2);

CREATE TABLE quote_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    quote_id INT,
    user_id INT,
    log_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(20)
);

DELIMITER //

CREATE TRIGGER trg_broker_email_validation
BEFORE INSERT ON broker_info
FOR EACH ROW
BEGIN
    IF NEW.email IS NULL OR NEW.email = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Broker email cannot be empty';
    END IF;
END;
//

DELIMITER ;

SELECT * FROM premium_rate_config
ORDER BY vehicle_category ASC, gst_percent DESC;
