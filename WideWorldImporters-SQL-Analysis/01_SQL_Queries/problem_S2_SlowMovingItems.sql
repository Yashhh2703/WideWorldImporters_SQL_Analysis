USE WideWorldImporters;
GO

SELECT 
    SI.StockItemID,
    SI.StockItemName,
    SUM(IL.Quantity) AS TotalQuantitySold
FROM 
    Sales.InvoiceLines AS IL
INNER JOIN 
    Sales.Invoices AS I ON IL.InvoiceID = I.InvoiceID
INNER JOIN 
    Warehouse.StockItems AS SI ON IL.StockItemID = SI.StockItemID
WHERE 
    I.InvoiceDate >= '2015-06-01'  -- Replace this with an actual known date from your data
GROUP BY 
    SI.StockItemID,
    SI.StockItemName
ORDER BY 
    TotalQuantitySold ASC;
