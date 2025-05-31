USE WideWorldImporters;
GO

SELECT SI.StockItemID, stockitemname, quantityonhand 
from Warehouse.StockItems SI
INNER JOIN Warehouse.StockItemHoldings SH on SI.StockItemID = SH.StockItemID
where QuantityOnHand < 50 