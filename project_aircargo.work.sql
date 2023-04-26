USE project_aircargo;

/*
###########################################
#2.	Write a query to create route_details table using suitable data types for the fields, such as route_id, flight_num, origin_airport, destination_airport, aircraft_id, and distance_miles. 
#Implement the check constraint for the flight number and unique constraint for the route_id fields. Also, make sure that the distance miles field is greater than 0.

DROP TABLE IF EXISTS route_details;
CREATE TABLE IF NOT EXISTS route_details(
	route_id INT UNIQUE NOT NULL,
	flightnum INT NOT NULL CHECK(flightnum > 0),
	origin_airport CHAR(3) NOT NULL,
    destination_airport CHAR(3) NOT NULL,
    aircraft_id VARCHAR(20) NOT NULL,
    distance_miles INT NOT NULL CHECK(distance_miles > 0)
);

    
INSERT INTO route_details(route_id, flightnum, origin_airport, destination_airport, aircraft_id, distance_miles) VALUES
	(1, 1111, 'EWR', 'HNL', '767-301ER', 4962),
	(2, 1112, 'HNL', 'EWR', '767-301ER', 4962),
	(3, 1113, 'EWR' ,'LHR' ,'A321' , 3466),
	(4, 1114, 'JFK', 'LAX', '767-301ER', 2475),
	(5, 1115, 'LAX', 'JFK', '767-301ER', 2475),
	(6, 1116, 'HNL', 'LAX' ,'767-301ER', 2556),
	(7, 1117, 'LAX', 'ORD', 'A321' , 1745),
	(8, 1118, 'ORD', 'EWR', 'A321', 719),
	(9, 1119, 'DEN', 'LAX', 'ERJ142', 862),
	(10, 1120, 'HNL', 'DEN', 'A321', 3365),
	(12, 1122, 'ABI', 'ADK', '767-301ER', 4300),
	(13, 1123, 'ADK', 'BQN', 'A321', 2232),
	(14, 1124, 'BQN', 'CAK', 'A321', 2445),
	(15, 1125, 'CAK', 'ANI', '767-301ER', 2000),
	(16, 1126, 'ALB', 'APN', 'A321', 1700),
	(17, 1127, 'APN', 'BLV', '767-301ER', 1900),
	(18, 1128, 'ANI', 'BGR', 'ERJ142' ,2450),
	(19, 1129, 'ATW', 'AVL', 'A321', 2222),
	(20, 1130, 'AVL', 'BOI', '767-301ER', 3134),
	(21, 1131, 'BFL', 'BET', 'A321', 2425),
	(22, 1132, 'BGR', 'BJI', 'ERJ142', 1242),
	(23, 1133, 'BLV', 'BFL', '767-301ER', 2354),
	(24, 1134, 'BJI', 'BQN', 'A321', 1575),
	(25, 1135, 'RDM', 'BJI', 'A321', 2425),
	(26, 1136, 'BET', 'BTM', 'ERJ142', 1311),
	(27, 1137, 'BOI', 'CLD', 'A321', 578),
	(28, 1138, 'BOS', 'CDC', '767-301ER', 246),
	(29, 1139, 'BKG', 'CRW', '767-301ER', 909),
	(30, 1140, 'BUR', 'STT', 'CRJ900', 780),
	(31, 1141, 'BTM', 'CHA', 'ERJ142', 660),
	(32, 1142, 'CLD', 'CHI', '767-301ER', 246),
	(33, 1143, 'CDC', 'CST', 'CRJ900', 1345),
	(34, 1144, 'CRW', 'COD', 'A321', 2452),
	(35, 1145, 'STT', 'CDB', 'ERJ142', 2121),
	(36, 1146, 'CHA', 'COU', 'CRJ900', 1212),
	(37, 1147, 'CHI', 'CST', '767-301ER', 999),
	(38, 1148, 'CST', 'DAL', 'A321', 1111),
	(39, 1149, 'COD', 'SCC', 'CRJ900', 1579),
	(40, 1150, 'CDB', 'DEC', 'A321', 909),
	(41, 1151, 'CAE', 'DRT', 'ERJ142', 898),
	(42, 1152, 'CSG', 'BOS', '767-301ER', 890),
	(43, 1153, 'CBM', 'BOI', 'A321', 8989),
	(44, 1154, 'COU', 'CAK', '767-301ER', 7676),
	(45, 1155, 'CCR', 'EWR', 'CRJ900', 676),
	(46, 1156, 'CDV', 'HNL', '767-301ER', 8668),
	(47, 1157, 'DAL', 'LAX', 'CRJ900', 675),
	(48, 1158, 'SCC', 'DEN', 'A321', 5645),
	(49, 1159, 'DEC', 'ABI', 'A321', 4533),
	(50, 1160, 'DRT', 'ORD', 'A321', 2445);

SELECT * from route_details;
#############################################
*/


#############################################
#3.	Write a query to display all the passengers (customers) who have traveled in routes 01 to 25. Take data from the passengers_on_flights table.
SELECT * FROM passengers_on_flights
WHERE (route_id >= 1) and (route_id <= 25);

SELECT 
	C.first_name,
    C.last_name,
    C.gender,
    P.route_id
FROM customers C
JOIN passengers_on_flights P
ON C.customer_id = P.customer_id
WHERE (route_id >= 1) and (route_id <= 25);
#############################################

#4.	Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.

SELECT * FROM ticket_details;

SELECT * FROM ticket_details
WHERE class_id LIKE '%Bussiness%';

SELECT 
	count(*) as total_passengers_bussiness_class,
	CONCAT('$', Sum(no_of_tickets * Price_per_ticket)) AS total_revenue_bussiness_class
FROM ticket_details
WHERE class_id LIKE '%Bussiness%';
#############################################

#5.	Write a query to display the full name of the customer by extracting the first name and last name from the customer table.
SELECT DISTINCT
#	first_name,
#    last_name,
	concat(first_name, ' ', last_name) as full_name FROM customers;

#############################################

#6.	Write a query to extract the customers who have registered and booked a ticket. Use data from the customer and ticket_details tables.
#SELECT * FROM customers;
#SELECT * FROM ticket_details;

SELECT 
	customers.customer_id, first_name, last_name, date_of_birth, gender,
    p_date, aircraft_id, class_id, no_of_tickets, a_code, Price_per_ticket, brand
FROM customers, ticket_details 
WHERE customers.customer_id = ticket_details.customer_id;

#SELECT DISTINCT customer_id FROM ticket_details;
/*
SELECT 
	DISTINCT first_name, last_name FROM
(
SELECT 
	C.first_name,
    C.last_name,
    T.aircraft_id,
	T.class_id
FROM customers C
JOIN ticket_details T
ON C.customer_id = T.customer_id
) TBL;
*/   
#############################################
#7.	Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table
SELECT * FROM customers;
SELECT * FROM ticket_details;

SELECT
	TBL.customer_id,
	first_name, 
    last_name,
    brand
FROM customers
JOIN
(SELECT DISTINCT customer_id, brand FROM ticket_details) TBL
ON customers.customer_id = TBL.customer_id
ORDER BY first_name;

/*
SELECT 
	first_name, last_name FROM
#	DISTINCT first_name, last_name FROM
(
SELECT    
	C.first_name,
    C.last_name,
    T.customer_id,
    T.brand
FROM customers C
JOIN ticket_details T
ON C.customer_id = T.customer_id
GROUP BY T.customer_id, T.brand
) TBL
ORDER BY first_name;
*/

/*
SELECT
	first_name, 
    last_name,
    brand
FROM customers
JOIN
(SELECT DISTINCT customer_id, brand FROM ticket_details) TBL
ON customers.customer_id = TBL.customer_id
ORDER BY first_name;
*/
#############################################

#8.	Write a query to identify the customers who have traveled by Economy Plus class using Group By and Having clause on the passengers_on_flights table
SELECT * FROM customers;
SELECT * FROM passengers_on_flights;

SELECT 	
		passengers_on_flights.customer_id,
		first_name, 
		last_name, 
        class_id
FROM customers, passengers_on_flights
WHERE customers.customer_id = passengers_on_flights.customer_id
GROUP BY customer_id, class_id, first_name, last_name
HAVING class_id = 'Economy Plus';

#############################################

#9.	Write a query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table.
SELECT * FROM ticket_details;

SELECT 
	Sum(no_of_tickets * Price_per_ticket) AS total_revenue,
    IF (
		(Sum(no_of_tickets * Price_per_ticket) > 10000), 'YES', 'NO')
    AS 'total_revenue_exceed_10000?'
FROM ticket_details;
#WHERE class_id LIKE '%Bussiness%';

#############################################
#10. Write a query to create a view with only business class customers along with the brand of airlines.
/*
SELECT * FROM customers;
SELECT * FROM passengers_on_flights;
SELECT * FROM ticket_details;

SELECT * FROM passengers_on_flights WHERE passengers_on_flights.class_id LIKE '%Bussiness%';


SELECT 
	ticket_details.customer_id, 
    ticket_details.brand
FROM passengers_on_flights
JOIN  ticket_details
ON passengers_on_flights.customer_id = ticket_details.customer_id
WHERE ticket_details.class_id LIKE '%Bussiness%'
GROUP BY ticket_details.customer_id, ticket_details.brand;
*/

CREATE VIEW `customer_businessclass_brand` AS 
SELECT TBL.customer_id, first_name, last_name, brand FROM customers
JOIN
(
SELECT 
	ticket_details.customer_id, 
    ticket_details.brand
FROM passengers_on_flights
JOIN  ticket_details
ON passengers_on_flights.customer_id = ticket_details.customer_id
WHERE ticket_details.class_id LIKE '%Bussiness%'
GROUP BY ticket_details.customer_id, ticket_details.brand
) TBL
WHERE customers.customer_id = TBL.customer_id;

SELECT * FROM `customer_businessclass_brand`;

#############################################
SELECT * FROM customers;
SELECT * FROM passengers_on_flights;
SELECT * FROM routes;
#11. Write a query to create a stored procedure to get the details of all passengers flying between a range of routes defined in run time. Also, return an error message if the table doesn't exist.
/*
SELECT * FROM customers
JOIN
(
SELECT 
		P.customer_id, P.aircraft_id, P.depart, P.arrival, P.seat_num, P.class_id, P.travel_date, P.flight_num,
        R.origin_airport, R.destination_airport, R.distance_miles
 FROM passengers_on_flights P
JOIN routes R
ON P.route_id = R.route_id
ORDER BY R.route_id
)TBL
ON customers.customer_id = TBL.customer_id
ORDER BY customers.customer_id;
*/


DROP PROCEDURE IF EXISTS passengersDetailsInRouteRange;
DELIMITER $$
CREATE PROCEDURE passengersDetailsInRouteRange(IN beginRoute INT, IN endRoute INT)
BEGIN

    DECLARE EXIT HANDLER FOR 1146
    BEGIN
    SELECT('Table not exist');
    END;
/*
	DECLARE minrouteid INT;
    DECLARE maxrouteid INT;
    SET minrouteid = (select min(routes.route_id) FROM routes);
    SET maxrouteid = (select max(routes.route_id) FROM routes);
    
    
	IF (beginRoute < minrouteid) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'First parameter lower than min route id in database. Invalid.  ';
	ELSEIF (endRoute > (select max(routes.route_id) FROM routes) ) THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Second parameter greater than max route id in database. Invalid';
    END IF;
*/

SELECT 
	customers.customer_id, first_name, last_name, date_of_birth, gender,
    passengers_on_flights.aircraft_id, passengers_on_flights.route_id, depart, arrival, seat_num, class_id, travel_date, passengers_on_flights.flight_num,
    origin_airport, destination_airport, distance_miles
FROM customers, passengers_on_flights, routes
WHERE (passengers_on_flights.route_id >= beginRoute AND passengers_on_flights.route_id <= endRoute)
AND (customers.customer_id = passengers_on_flights.customer_id)
AND (passengers_on_flights.route_id = routes.route_id)
ORDER BY customers.customer_id;

/*
SELECT * FROM customers
JOIN
(
SELECT 
#		P.customer_id, P.aircraft_id, P.depart, P.arrival, P.seat_num, P.class_id, P.travel_date, P.flight_num,
		P.customer_id, P.aircraft_id, P.route_id, P.depart, P.arrival, P.seat_num, P.class_id, P.travel_date, P.flight_num,
        R.origin_airport, R.destination_airport, R.distance_miles
FROM passengers_on_flights P
JOIN routes R
ON P.route_id = R.route_id 
WHERE (P.route_id >= beginRoute AND P.route_id <= endRoute)
#ORDER BY R.route_id
)TBL
ON customers.customer_id = TBL.customer_id
ORDER BY customers.customer_id;
*/

END $$

DELIMITER ;

CALL passengersDetailsInRouteRange(1,50);

/*
delimiter $$
create procedure get_products__count(in category varchar(30), 
out count_product int)
begin
select count(*) into count_product from sales_managers.products
where product_category = category;
end $$
delimiter ;

*/

#############################################
SELECT * FROM customers;
SELECT * FROM passengers_on_flights;
SELECT * FROM routes;
SELECT * FROM ticket_details;

#12. Write a query to create a stored procedure that extracts all the details from the routes table where the traveled distance is more than 2000 miles.

DROP PROCEDURE IF EXISTS routeDetailsDistanceabove2000;
DELIMITER $$
CREATE PROCEDURE routeDetailsDistanceabove2000()

BEGIN
	SELECT * FROM routes WHERE distance_miles > 2000;
END $$

DELIMITER ;

CALL routeDetailsDistanceabove2000();

#############################################

#13. Write a query to create a stored procedure that groups the distance traveled by each flight into three categories. 
#The categories are, short distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for >6500.

SELECT * FROM customers;
SELECT * FROM passengers_on_flights;
SELECT * FROM routes;
SELECT * FROM ticket_details;

DROP PROCEDURE IF EXISTS routeGrouping;
DELIMITER $$
CREATE PROCEDURE routeGrouping()

BEGIN
	SELECT *,
	CASE 
		WHEN (distance_miles >= 0 AND distance_miles <= 2000) THEN 'SDT'
        WHEN (distance_miles > 2000 AND distance_miles <= 6500) THEN 'IDT'
		ELSE 'LDT'
	END AS distance_group
    FROM routes
	ORDER BY distance_miles;
END $$

DELIMITER ;


CALL routeGrouping();
