-- CREATE DATABASE `Retail_Store`;
use `Retail_Store`;
CREATE TABLE `customer` (
   `customer_id` INT NOT NULL AUTO_INCREMENT,
   `customer_name` VARCHAR(50) NOT NULL,
   `birth_date` DATE, 
   `address` VARCHAR(50),
   PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;
INSERT INTO `customer` VALUES (1, 'AJOY','1990-05-20','KOLKATA');
INSERT INTO `customer`(`customer_name`,`birth_date`,`address`)
     VALUES ('BIJOY','1999-01-31', 'DELHI'),
            ('SUBHA','2000-08-10','KOLKATA'),
            ('RAHUL','1985-12-25','PUNE'),
            ('NITESH','1995-02-16','PATNA');


CREATE TABLE `customer_performance` (
   `ID` INT NOT NULL AUTO_INCREMENT,
   `customer_id` INT NOT NULL UNIQUE ,
   `points` INT NOT NULL DEFAULT '0',
   PRIMARY KEY (`ID`),
   FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON UPDATE CASCADE) 
ENGINE = InnoDB;
INSERT INTO `customer_performance` (`customer_id`,`points`) 
     VALUES (1,1200),(2,2000),(3,5000), (4,5500),(5,800);


INSERT INTO `customer`(`customer_name`,`birth_date`,`address`)
     VALUES ('RAJESH','1991-06-28', 'MUMBAI');

CREATE TABLE `order_status` (
   `order_status_id` INT NOT NULL,
   `name` VARCHAR(45),
   PRIMARY KEY (`order_status_id`)) 
ENGINE = InnoDB;
INSERT INTO `order_status`(`order_status_id`,`name`)
     VALUES (1,'processed'),
            (2,'shipped'),
            (3,'delivered');

     
CREATE TABLE `order` (
   `order_id` INT NOT NULL AUTO_INCREMENT,
   `customer_id` INT NOT NULL,
   `order_date` DATE NOT NULL, 
   `status` INT NOT NULL,
   PRIMARY KEY (`order_id`),
   FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`) ON UPDATE CASCADE,
   FOREIGN KEY (`status`) REFERENCES `order_status`(`order_status_id`) ON UPDATE CASCADE)
ENGINE = InnoDB;
INSERT INTO `order`(`customer_id`,`order_date`,`status`)
     VALUES (2,'2022-05-10',3),
            (5,'2022-06-01',3),
            (1,'2022-08-04',2),
            (2,'2022-08-30',2),
            (4,'2022-09-15',1),
            (5,'2022-10-04',1);

CREATE TABLE `product` (
   `product_id` INT NOT NULL AUTO_INCREMENT,
   `product_name` VARCHAR(50) NOT NULL,
   `quantity_in_stock` INT DEFAULT '0', 
   `unit_price` INT NOT NULL,
   PRIMARY KEY (`product_id`))
ENGINE = InnoDB;
INSERT INTO `product`(`product_name`,`quantity_in_stock`,`unit_price`)
     VALUES ('HISTORY BOOK',200,80),
            ('GEOGRAPHY BOOK', 150,90),
            ('STORY BOOK',500,70),
            ('MATH BOOK',250,100),
            ('PEN',800,10),
            ('PAPER',1000,10);

CREATE TABLE `order_item` (
   `order_id` INT NOT NULL,
   `product_id` INT NOT NULL,
   `quantity` INT DEFAULT '0',
   `unit price` INT DEFAULT '0',
   PRIMARY KEY (`order_id`,`product_id`),
   FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON UPDATE CASCADE,
   FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`) ON UPDATE CASCADE)
ENGINE = InnoDB;
INSERT INTO `order_item`(`order_id`,`product_id`,`quantity`,`unit price`)
     VALUES (1,2,10,900),
            (1,5,50,500),
            (2,1,15,1200),
            (2,6,60,600),
            (3,3,100,7000),
            (3,4,30,3000),
            (5,4,25,2500);
            


SELECT c.customer_name,order_date,product_name,os.name AS status
FROM Retail_Store.order o 
RIGHT JOIN customer c 
    ON c.customer_id = o.customer_id
LEFT JOIN order_item oi
    ON oi.order_id = o.order_id
LEFT JOIN product p
    ON oi.product_id = p.product_id
LEFT JOIN order_status os
    ON os.order_status_id = o.status









            

