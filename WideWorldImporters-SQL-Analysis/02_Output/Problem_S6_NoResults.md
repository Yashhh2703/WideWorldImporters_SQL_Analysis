# Explanation: No Inactive Customers Found

## Why This Query Returned Empty Results
- The WideWorldImporters sample database contains only **active customers**  
- All customers had orders within the last 3 months (no inactivity)  

## Real-World Use Case
In production environments, this query helps:
- 🎯 Identify churned customers for re-engagement campaigns  
- 📉 Analyze customer retention trends  
- 📧 Trigger automated win-back emails  

```sql
-- Sample query logic
SELECT CustomerID, CustomerName 
FROM Sales.Customers
WHERE LastOrderDate < DATEADD(month, -3, GETDATE())
   OR LastOrderDate IS NULL;
