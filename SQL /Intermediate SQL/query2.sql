-- Write your queries to insert data here

INSERT INTO client (first_name, last_name, email) VALUES
('Sara', 'Smith', 'smiths@hello.com'), 
('Miguel', 'Cabrera', 'mc@hello.com'),
('Bo', "Chan'g", 'bochang@hello.com')
; 

INSERT INTO employee (first_name, last_name, start_date, email) VALUES 
('Ananya', 'Jaiswal', '2008-04-10', 'ajaiswal@hello.com'),
('Michael', 'Fern', '2015-07-19', 'michaelf@hello.com'), 
('Abdul', 'Rehman', '2018-02-27', 'rehman@hello.com')
;

INSERT INTO project (title, comments, cid) VALUES
('Diamond', 'Should be done by Jan 2019', (SELECT id FROM client WHERE first_name = 'Sara' AND last_name = 'Smith'));

INSERT INTO project (title, comments, cid) VALUES
("Chan'g", 'Ongoing maintenance', (SELECT id FROM client WHERE first_name = 'Bo' AND last_name = "Chan'g"));

INSERT INTO project (title, comments, cid) VALUES
('The Robinson Project', NULL, (SELECT id FROM client WHERE first_name = 'Miguel' AND last_name = 'Cabrera'));


INSERT INTO works_on (pid, eid, due_date) VALUES 
((SELECT id FROM project WHERE title = "Diamond"), (SELECT id FROM employee WHERE first_name = 'Abdul'), '2021-01-01');


INSERT INTO works_on (pid, eid, due_date) VALUES 
((SELECT id FROM project WHERE title = "The Robinson Project"), (SELECT id FROM employee WHERE first_name = 'Michael'), '2020-12-05');

INSERT INTO works_on (pid, eid, due_date) VALUES 
((SELECT id FROM project WHERE title = "Chan'g"), (SELECT id FROM employee WHERE first_name = 'Ananya'), '2020-11-19');




