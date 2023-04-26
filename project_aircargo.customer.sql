USE project_aircargo;
SELECT * FROM project_aircargo.customers;

###
#ALTER TABLE customer
#MODIFY date_of_birth DATE;
###

SELECT * FROM project_aircargo.customers;

ALTER TABLE customer RENAME customers;


ALTER TABLE customers
MODIFY first_name VARCHAR(20),
MODIFY last_name VARCHAR(20),
MODIFY gender CHAR(1);


### add primary key
#ALTER TABLE `project_aircargo`.`customer` 
#CHANGE COLUMN `customer_id` `customer_id` INT NOT NULL ,
#ADD PRIMARY KEY (`customer_id`);
###
