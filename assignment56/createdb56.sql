CREATE TABLE IF NOT EXISTS Emergency_Contact(
	emergencycontactid BIGINT NOT NULL AUTO_INCREMENT,
	emergencycontactforename VARCHAR(255) NOT NULL,
	emergencycontactsurname VARCHAR(255) NOT NULL,
	emergencycontactnumber VARCHAR(64) NOT NULL,
	PRIMARY KEY (emergencycontactid)
);



CREATE TABLE IF NOT EXISTS Person(
	personid BIGINT NOT NULL AUTO_INCREMENT,
	forename VARCHAR(255) NOT NULL,
	surname VARCHAR(255) NOT NULL,
	emergencycontactid BIGINT NOT NULL,
	PRIMARY KEY (personid),
	FOREIGN KEY (emergencycontactid) REFERENCES Emergency_Contact(emergencycontactid)
);



CREATE TABLE IF NOT EXISTS Employee(
	employeeid BIGINT NOT NULL AUTO_INCREMENT,
	personid BIGINT NOT NULL,
	salary VARCHAR(20),
	PRIMARY KEY (employeeid),
	FOREIGN KEY (personid) REFERENCES Person(personid)
);


CREATE TABLE IF NOT EXISTS Building(
	buildingid BIGINT NOT NULL AUTO_INCREMENT,
	buildingnumber INT,
	streetname VARCHAR(255),
	town VARCHAR (255),
	city VARCHAR (255),
	POSTCODE varchar (10),
	PRIMARY KEY (buildingid)
);




CREATE TABLE IF NOT EXISTS Manager(
	managerid BIGINT NOT NULL AUTO_INCREMENT,
	employeeid BIGINT NOT NULL,
	PRIMARY KEY (managerid),
    FOREIGN KEY (employeeid) REFERENCES Employee(employeeid)
);


CREATE TABLE IF NOT EXISTS Apartment(
	apartmentid BIGINT NOT NULL AUTO_INCREMENT,
	buildingid BIGINT NOT NULL,
	managerid BIGINT NOT NULL,
	noofbedrooms INT,
	noofbathrooms INT,
	area DOUBLE,
	PRIMARY KEY (apartmentid),
	FOREIGN KEY(buildingid) REFERENCES Building(buildingid),
	FOREIGN KEY(managerid) REFERENCES Manager(managerid)
	);



CREATE TABLE IF NOT EXISTS Office(
	officeid BIGINT NOT NULL AUTO_INCREMENT,
	apartmentid BIGINT NOT NULL,
	managerid BIGINT NOT NULL,
	PRIMARY KEY (officeid),
	FOREIGN KEY(apartmentid) REFERENCES Apartment(apartmentid),
	FOREIGN KEY(managerid) REFERENCES Manager(managerid)
);


CREATE TABLE IF NOT EXISTS Skill(
	skillid BIGINT NOT NULL AUTO_INCREMENT,
	skilltitle VARCHAR(255),
	PRIMARY KEY (skillid)
);



CREATE TABLE IF NOT EXISTS Technician(
	technicianid BIGINT NOT NULL AUTO_INCREMENT,
	employeeid BIGINT NOT NULL,
	PRIMARY KEY (technicianid),
	FOREIGN KEY (employeeid) REFERENCES Employee(employeeid)
	);




CREATE TABLE IF NOT EXISTS TechnicianSkill(
	technicianSkillid BIGINT NOT NULL AUTO_INCREMENT,
	technicianid BIGINT NOT NULL,
	skillid BIGINT NOT NULL,
	PRIMARY KEY (technicianSkillid),
	FOREIGN KEY (technicianid) REFERENCES Technician(technicianid),
	FOREIGN KEY (skillid) REFERENCES Skill(skillid)
);




CREATE TABLE IF NOT EXISTS Lease(
	leaseid BIGINT NOT NULL AUTO_INCREMENT,
	managerid BIGINT NOT NULL,
	apartmentid BIGINT NOT NULL,
startdate DATE,
	expectedduration INT,
	rentamount VARCHAR(20),
	active BIT,
	PRIMARY KEY (leaseid),
	FOREIGN KEY (managerid) REFERENCES Manager(managerid),
	FOREIGN KEY (apartmentid) REFERENCES Apartment(apartmentid)

);


CREATE TABLE IF NOT EXISTS Tenant(
	tenantid BIGINT NOT NULL AUTO_INCREMENT,
	personid BIGINT NOT NULL,
	leaseid BIGINT NOT NULL,
	bankAccountNo VARCHAR(8),
	PRIMARY KEY (tenantid),
	FOREIGN KEY (personid) REFERENCES Person(personid),
	FOREIGN KEY (leaseid) REFERENCES Lease(leaseid)
);



CREATE TABLE IF NOT EXISTS Guest(
	guestid BIGINT NOT NULL AUTO_INCREMENT,
	personid BIGINT NOT NULL,
	apartmentid BIGINT NOT NULL,
	arrivalDate DATE NOT NULL,
	departureDate DATE NOT NULL,
	PRIMARY KEY (guestid),
	FOREIGN KEY (personid) REFERENCES Person(personid),
	FOREIGN KEY (apartmentid) REFERENCES Apartment(apartmentid));
