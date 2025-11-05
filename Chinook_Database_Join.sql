/*
This query joins five tables in the Chinook database:
Customer, Invoice, InvoiceLine, Track, and Album.
It retrieves each customer's purchased tracks and albums.
*/
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