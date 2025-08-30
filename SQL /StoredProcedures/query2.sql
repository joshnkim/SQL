DROP VIEW IF EXISTS v_cert_people;
CREATE VIEW v_cert_people AS
SELECT 
    bsg_cert.title AS title,
    bsg_people.fname, 
    bsg_people.lname, 
    bsg_planets.name AS planet_name 
FROM 
    bsg_cert_people
JOIN 
    bsg_cert ON bsg_cert_people.cid= bsg_cert.id
JOIN 
	bsg_people ON bsg_cert_people.pid = bsg_people.id
LEFT JOIN 
    bsg_planets ON bsg_people.homeworld = bsg_planets.id
ORDER BY 
    bsg_people.lname;

SELECT * FROM v_cert_people;