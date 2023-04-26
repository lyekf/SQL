USE project_aircargo;
SELECT * FROM project_aircargo.passengers_on_flights;

###
#ALTER TABLE passengers_on_flights
#MODIFY travel_date DATE;
###

SELECT * FROM project_aircargo.passengers_on_flights;

SELECT DISTINCT flight_num from passengers_on_flights;
SELECT DISTINCT route_id from passengers_on_flights;
SELECT DISTINCT (route_id and flight_num) from passengers_on_flights;



ALTER TABLE passengers_on_flights
MODIFY aircraft_id VARCHAR(20),
MODIFY depart CHAR(3),
MODIFY arrival CHAR(3),
MODIFY seat_num VARCHAR(5),
MODIFY class_id VARCHAR(20);

ALTER TABLE passengers_on_flights DROP PRIMARY KEY;
ALTER TABLE passengers_on_flights DROP FOREIGN KEY fk_customer_id;
ALTER TABLE passengers_on_flights DROP FOREIGN KEY fk_route_id;

ALTER TABLE passengers_on_flights
	ADD PRIMARY KEY(aircraft_id, seat_num, flight_num);
    
ALTER TABLE passengers_on_flights
	ADD CONSTRAINT `fk_customer_id_passengers_on_flights` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
	ADD CONSTRAINT `fk_customer_id_routes` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`);        



/* add foreign key `fk_customer_id`
ALTER TABLE `project_aircargo`.`passengers_on_flights` 
ADD INDEX `fk_customer_id_idx` (`customer_id` ASC) VISIBLE;
;
ALTER TABLE `project_aircargo`.`passengers_on_flights` 
ADD CONSTRAINT `fk_customer_id`
  FOREIGN KEY (`customer_id`)
  REFERENCES `project_aircargo`.`customer` (`customer_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/

/* /* add foreign key `fk_route_id`
ALTER TABLE `project_aircargo`.`passengers_on_flights` 
ADD INDEX `fk_route_id_idx` (`route_id` ASC) VISIBLE;
;
ALTER TABLE `project_aircargo`.`passengers_on_flights` 
ADD CONSTRAINT `fk_route_id`
  FOREIGN KEY (`route_id`)
  REFERENCES `project_aircargo`.`routes` (`route_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
*/