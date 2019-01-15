
SELECT
	Person.personid,
	forename,
	surname,
	COUNT(guestid) AS "No. Of Stays"
FROM
	Guest
	LEFT OUTER JOIN Person ON Guest.personid = Person.personid
WHERE
	ArrivalDate BETWEEN '2017-11-24'
	AND '2018-11-24'
GROUP BY
	personid
HAVING
	COUNT(guestid) > 1;





SELECT
	Manager.managerid,
	Person.forename,
	Person.surname,
	Office.officeid
FROM
	Manager
	INNER JOIN Employee ON Employee.employeeid = Manager.employeeid
	INNER JOIN Person ON Person.personid = Employee.personid
	INNER JOIN Office ON Office.managerid = Manager.managerid
	INNER JOIN Apartment ON Apartment.apartmentid = Office.apartmentid
WHERE
	Apartment.buildingid = 2
	AND Employee.salary >= 30000
GROUP BY
	Manager.managerid;





SELECT
	Tenant.personid,
	Person.forename,
	Person.surname,
    Lease.apartmentid
FROM
	Tenant
	INNER JOIN Lease ON Tenant.leaseid = Lease.leaseid
	INNER JOIN Apartment ON Apartment.apartmentid = Lease.apartmentid
	INNER JOIN Person ON Tenant.personid = Person.personid
WHERE
	Apartment.buildingid = 1 AND Lease.ACTIVE = 0
GROUP BY
	Tenant.personid;



SELECT
	Manager.managerid,
	Person.forename,
	Person.surname
FROM
	Manager
	INNER JOIN Employee ON Employee.employeeid = Manager.employeeid
	INNER JOIN Person ON Person.personid = Employee.personid
	INNER JOIN Technician ON Technician.employeeid = Employee.employeeid
    INNER JOIN TechnicianSkill ON Technician.technicianid = TechnicianSkill.technicianid
	INNER JOIN Skill ON Skill.skillid = TechnicianSkill.skillid
	LEFT JOIN Lease ON Lease.managerid = Manager.managerid
WHERE
	Skill.skillid = 1
	AND Manager.managerid NOT IN (Select Lease.managerid FROM Lease WHERE Lease.active =1)
GROUP BY Manager.managerid;
