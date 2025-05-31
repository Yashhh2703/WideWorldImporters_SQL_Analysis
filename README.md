# 🔍 SQL Analysis: WideWorldImporters Database

**Project Description**  
This repository contains SQL queries analyzing Microsoft's **WideWorldImporters** sample database. The project focuses on real-world business insights, including:

- 📉 Inventory management (low stock, slow movers)  
- 💰 Sales performance (monthly trends, top reps)  
- 🏷️ Customer segmentation (Gold/Silver/Bronze tiers)  
- 🚚 Supplier delivery performance  
- 📦 Product category profitability  

---

## 📂 Files

- **SQL Queries**: [View folder »](./SQL_Queries)  
- **Outputs**: [View folder »](./Outputs)

---

## 📌 Problem Statements

| No. | Topic                                      | Query File                                                  | Output File                             |
|-----|--------------------------------------------|--------------------------------------------------------------|------------------------------------------|
| 1   | Low Stock Items                            | `SQL_Queries/Problem_S1_LowStockItems.sql`                  | `Outputs/Problem_S1_Output.png`         |
| 2   | Slow-Moving Products                       | `SQL_Queries/Problem_S2_SlowMovingItems.sql`                | `Outputs/Problem_S2_Output.csv`         |
| 3   | Monthly Sales Trends                       | `SQL_Queries/Problem_S3_MonthlySalesTrends.sql`             | `Outputs/Problem_S3_Output.png`         |
| 4   | Top Sales Representatives                  | `SQL_Queries/Problem_S4_SalesRepresentativePerformance.sql` | `Outputs/Problem_S4_Output.png`         |
| 5   | Customer Segmentation                      | `SQL_Queries/Problem_S5_CustomerSegmentation.sql`           | `Outputs/Problem_S5_Output.png`         |
| 6   | Inactive Customers (No Output Expected)    | `SQL_Queries/Problem_S6_InactiveCustomers.sql`              | _No output — all customers are active_  |
| 7   | Supplier Performance Evaluation            | `SQL_Queries/Problem_S7_SuppliersPerformance.sql`           | `Outputs/Problem_S7_Output.png`         |
| 8   | Profitability by Product Category          | `SQL_Queries/Problem_S8_ProfitabilityByCategory.sql`        | `Outputs/Problem_S8_Output.png`         |

> ⚠️ Problem 6 returns no data, which is expected — all customers in the dataset made purchases within the last 6 months (ending May 2016).

---

## 🖼️ Sample Outputs

### 📊 Monthly Sales Trends
![Monthly Sales Trends](./Outputs/Problem_S3_Output.png)

### 🚚 Supplier Performance
![Supplier Performance](./Outputs/Problem_S7_Output.png)

### 💰 Profitability by Product Category
![Profitability by Category](./Outputs/Problem_S8_Output.png)

---

## 🛠️ How to Run

1. Download and install the WideWorldImporters DB:  
   [Microsoft Official Guide](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-what-is)
2. Open `.sql` files using **SQL Server Management Studio (SSMS)**.
3. Add this line at the top of each query:
   ```sql
   USE WideWorldImporters;
   GO
