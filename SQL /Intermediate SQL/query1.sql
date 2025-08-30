-- Write the query to create the 4 tables below.

CREATE TABLE client (
id INT(11) AUTO_INCREMENT, 
first_name VARCHAR(255) NOT NULL, 
last_name VARCHAR(255) NOT NULL, 
email VARCHAR(255) NOT NULL,
PRIMARY KEY (id),
CONSTRAINT full_name UNIQUE (first_name, last_name)
);

CREATE TABLE employee (
id INT(11) AUTO_INCREMENT, 
first_name VARCHAR(255) NOT NULL, 
last_name VARCHAR(255) NOT NULL, 
start_date DATE NOT NULL, 
email VARCHAR(255) NOT NULL, 
PRIMARY KEY (id),
CONSTRAINT full_name UNIQUE (first_name, last_name)
);

CREATE TABLE project (
id INT(11) AUTO_INCREMENT, 
title VARCHAR(255) NOT NULL UNIQUE, 
comments TEXT, 
cid INT,
PRIMARY KEY (id),
FOREIGN KEY (cid) REFERENCES client(id) 
);

CREATE TABLE works_on (
pid INT, 
eid INT,
due_date DATE NOT NULL, 
PRIMARY KEY (pid, eid),
FOREIGN KEY (pid) REFERENCES project(id),
FOREIGN KEY (eid) REFERENCES employee(id)
);

