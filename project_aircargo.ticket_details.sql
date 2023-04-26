USE project_aircargo;

SELECT * FROM project_aircargo.ticket_details;

###
#ALTER TABLE ticket_details
#MODIFY p_date DATE;
###
SELECT * FROM project_aircargo.ticket_details;


ALTER TABLE ticket_details
MODIFY aircraft_id VARCHAR(20),
MODIFY class_id VARCHAR(20),
MODIFY a_code CHAR(3),
MODIFY brand VARCHAR(20);


ALTER TABLE ticket_details DROP FOREIGN KEY `fk_customer_id`;


ALTER TABLE ticket_details
	ADD CONSTRAINT `fk_customer_id_ticket_details` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
    
#Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'fk_aircraft_id' in the referenced table 'passengers_on_flights'


