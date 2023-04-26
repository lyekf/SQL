USE project_aircargo;

SELECT * FROM project_aircargo.routes;

### add primary key
#ALTER TABLE `project_aircargo`.`routes` 
#CHANGE COLUMN `route_id` `route_id` INT NOT NULL ,
#ADD PRIMARY KEY (`route_id`);
###

/*
ALTER TABLE routes
MODIFY origin_airport CHAR(3),
MODIFY destination_airport CHAR(3),
MODIFY aircraft_id VARCHAR(20);
*/