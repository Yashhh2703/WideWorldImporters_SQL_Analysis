USE WideWorldImporters;
GO

SELECT 
	C.CustomerID, 
	CustomerName, 
	FORMAT(SUM(IL.UnitPrice * IL.Quantity), 'N0') AS TotalPurchase,
CASE
	WHEN SUM(IL.UnitPrice * IL.Quantity) >= 100000 THEN 'GOLD'
	WHEN SUM(IL.UnitPrice * IL.Quantity) BETWEEN 50000 AND 99999 THEN 'Silver'
	ELSE 'Bronze'
END AS Tier
From Sales.InvoiceLines IL
INNER JOIN Sales.Invoices I on IL.InvoiceID = I.InvoiceID
INNER JOIN Sales.Customers C on I.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.CustomerName
ORDER BY SUM(IL.UnitPrice * IL.Quantity) DESC