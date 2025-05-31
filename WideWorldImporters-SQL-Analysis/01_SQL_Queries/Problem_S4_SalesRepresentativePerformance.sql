USE WideWorldImporters;
GO

SELECT TOP 5
	P.FullName, 
	FORMAT(SUM(IL.UnitPrice * IL.Quantity), 'N0') AS TotalRevenue
FROM Sales.InvoiceLines IL
INNER JOIN Sales.Invoices I on IL.InvoiceID = I.InvoiceID
INNER JOIN Application.People P on I.SalespersonPersonID = P.PersonID
WHERE YEAR(I.InvoiceDate) = 2016
GROUP BY P.FullName
ORDER BY TotalRevenue DESC