
CREATE TABLE Customers (
CustomerID INT NOT NULL AUTO_INCREMENT, 
CustomerName VARCHAR(50),
AddressLine1 VARCHAR(50),
AddressLine2 VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
PostalCode VARCHAR(50),
YTDPurchases DECIMAL(19,2),
PRIMARY KEY (CustomerID)
);

SHOW TABLES;
DESC Customers;

INSERT INTO Customers (CustomerName, AddressLine1, City, State, PostalCode)
VALUES
('Bike World', '60025 Bollinger Canyon Road', 'San Ramon', 'California', '94583'),
('Metro Sports', '482505 Warm Springs Blvd', 'Fremont', 'California', '94536'), 
('Josh Golf Co', '9000 Pennsylvania Ave', 'La Crescenta', 'California', '91214')
;

SELECT * FROM Customers; 
SELECT CustomerID, CustomerName FROM Customers WHERE PostalCode = '94536';

CREATE TABLE TermsCode (
TermsCodeID VARCHAR(50) NOT NULL,
Description VARCHAR(50),
PRIMARY KEY (TermsCodeID)
);


INSERT INTO TermsCode (TermsCodeID, Description) 
VALUES ('NET30', 'Payment due in 30 days.'), 
('NET15', 'Payment due in 15 days.'), 
('210NET30', '2% discount in 10 days Net 30')
;


CREATE TABLE Invoices (
InvoiceID INT NOT NULL AUTO_INCREMENT,
CustomerID INT, 
InvoiceDate DATETIME, 
TermsCodeID VARCHAR(50),
TotalDue DECIMAL(19,2),
PRIMARY KEY (InvoiceID), 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (TermsCodeID) REFERENCES TermsCode(TermsCodeID)
);

INSERT INTO Invoices (CustomerID, InvoiceDate, TotalDue, TermsCodeID)
VALUES 
(2, '20140207', 2388.98, 'NET30'), 
(1, '20140202', 2443.35, '210NET30'), 
(1, '20140209', 8752.32, 'NET30')
;

DESCRIBE Invoices;

