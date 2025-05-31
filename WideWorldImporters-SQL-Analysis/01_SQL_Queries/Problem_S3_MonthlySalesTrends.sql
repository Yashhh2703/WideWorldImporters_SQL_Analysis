USE WideWorldImporters;
GO

SELECT 
	YEAR(I.InvoiceDate) AS SalesYear,
	MONTH(I.InvoiceDate) AS SalesMonth, 
	SUM(IL.UnitPrice * IL.Quantity) as TotalRevenue
FROM Sales.InvoiceLines IL 
	INNER JOIN Sales.Invoices I on IL.InvoiceID = I.InvoiceID
WHERE InvoiceDate >= '2015-06-01' AND InvoiceDate <= '2016-05-31'
GROUP BY YEAR(I.InvoiceDate), MONTH(I.InvoiceDate)
ORDER BY SalesYear, SalesMonth
