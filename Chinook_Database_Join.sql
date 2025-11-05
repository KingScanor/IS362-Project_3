
/*
This query joins five tables in the Chinook database:
Customer, Invoice, InvoiceLine, Track, and Album.
It retrieves each customer's purchased tracks and albums.
*/

/*
I downloaded the Chinook database script directly from 
the GitHub repository at https://github.com/lerocha/chinook-database/blob/master/ChinookDatabase/DataSources/Chinook_MySql.sql
In MySQL Workbench, I opened the Chinook_MySql.sql file and executed the script, 
which automatically created the Chinook database along with all its tables. 
*/

--  Use the new database
USE chinook;

-- Verify tables were created
SHOW TABLES;

-- Select each customer's purchased tracks and albums
SELECT
    c.LastName, -- Customer last name
    c.FirstName,-- Customer first name
    t.Name  AS TrackName, 
    a.Title AS AlbumTitle
FROM Customer AS c
JOIN Invoice       AS i  ON i.CustomerId = c.CustomerId -- Connect customers to invoices
JOIN InvoiceLine   AS il ON il.InvoiceId = i.InvoiceId -- Link invoice lines
JOIN Track         AS t  ON t.TrackId    = il.TrackId -- Match track info
JOIN Album         AS a  ON a.AlbumId    = t.AlbumId  -- Include album title
ORDER BY c.LastName, c.FirstName
LIMIT 5;