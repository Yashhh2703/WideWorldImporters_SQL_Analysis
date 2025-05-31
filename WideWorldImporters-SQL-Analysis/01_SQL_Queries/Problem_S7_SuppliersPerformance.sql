USE WideWorldImporters;
GO

SELECT 
    PO.SupplierID,
    S.SupplierName,
    AVG(DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate)) AS AvgDeliveryDays,
    MIN(DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate)) AS BestDeliveryTime,
    MAX(DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate)) AS WorstDeliveryTime,
    COUNT(*) AS TotalDeliveries,
    SUM(CASE WHEN DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate) <= 7 THEN 1 ELSE 0 END) AS OnTimeDeliveries,
    SUM(CASE WHEN DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate) > 7 THEN 1 ELSE 0 END) AS DelayedDeliveries,
    ROUND(
        SUM(CASE WHEN DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate) <= 7 THEN 1 ELSE 0 END) * 100.0 / 
        NULLIF(COUNT(*), 0), 
        2
    ) AS OnTimeRate,
    CASE 
        WHEN COUNT(*) > 0 AND AVG(DATEDIFF(DAY, PO.OrderDate, POL.LastReceiptDate)) <= 7 THEN 'Meeting Target'
        WHEN COUNT(*) > 0 THEN 'Needs Improvement'
        ELSE 'No Delivery Data'
    END AS PerformanceStatus
FROM 
    Purchasing.PurchaseOrders PO 
    INNER JOIN Purchasing.PurchaseOrderLines POL 
        ON PO.PurchaseOrderID = POL.PurchaseOrderID
    INNER JOIN Purchasing.Suppliers S 
        ON PO.SupplierID = S.SupplierID
WHERE
    POL.LastReceiptDate IS NOT NULL 
    AND PO.OrderDate IS NOT NULL
GROUP BY 
    PO.SupplierID, 
    S.SupplierName
ORDER BY 
    OnTimeRate DESC,
    AvgDeliveryDays