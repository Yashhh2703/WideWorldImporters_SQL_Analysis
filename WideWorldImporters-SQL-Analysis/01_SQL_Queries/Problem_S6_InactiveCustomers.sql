
/* 
QUERY PURPOSE: Find customers with no orders in 3+ months.
NOTE: Returns empty in WideWorldImporters (all customers are active).
*/


USE WideWorldImporters;
GO

SELECT 
    C.CustomerID,
    C.CustomerName,
    MAX(I.InvoiceDate) AS LastOrderDate,
    CASE 
        WHEN MAX(I.InvoiceDate) IS NULL THEN 'Never Ordered'
        ELSE 'Inactive'
    END AS Status
FROM 
    Sales.Customers C
    LEFT JOIN Sales.Invoices I ON C.CustomerID = I.CustomerID
GROUP BY 
    C.CustomerID, C.CustomerName
HAVING 
    MAX(I.InvoiceDate) IS NULL 
    OR MAX(I.InvoiceDate) < DATEADD(MONTH, -3, '2016-05-31')  -- '2016-02-29'
ORDER BY 
    LastOrderDate
