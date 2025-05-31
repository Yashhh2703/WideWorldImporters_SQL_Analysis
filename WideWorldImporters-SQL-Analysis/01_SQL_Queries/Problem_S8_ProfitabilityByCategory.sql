USE WideWorldImporters;
GO

SELECT 
    SG.StockGroupName AS ProductCategory,
    FORMAT(SUM(IL.UnitPrice * IL.Quantity), 'N0') AS TotalRevenue,
    FORMAT(SUM(SH.LastCostPrice * IL.Quantity), 'N0') AS TotalCost,
    FORMAT(SUM(IL.UnitPrice * IL.Quantity) - SUM(SH.LastCostPrice * IL.Quantity), 'N0') AS Profit,
    FORMAT(
        (SUM(IL.UnitPrice * IL.Quantity) - SUM(SH.LastCostPrice * IL.Quantity)) * 100.0 / 
        NULLIF(SUM(IL.UnitPrice * IL.Quantity), 0), 'N2'
    ) + '%' AS ProfitMargin
FROM Sales.InvoiceLines IL
INNER JOIN Warehouse.StockItems SI ON IL.StockItemID = SI.StockItemID
LEFT JOIN Warehouse.StockItemHoldings SH ON SI.StockItemID = SH.StockItemID
INNER JOIN Warehouse.StockItemStockGroups SIG ON SI.StockItemID = SIG.StockItemID
INNER JOIN Warehouse.StockGroups SG ON SIG.StockGroupID = SG.StockGroupID
GROUP BY SG.StockGroupName
ORDER BY 
    SUM(IL.UnitPrice * IL.Quantity) - SUM(SH.LastCostPrice * IL.Quantity) DESC;
