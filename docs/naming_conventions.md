# **Naming Conventions**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

---

## **Table of Contents**
- [1. General Principles](#1-general-principles)
- [2. Table Naming Conventions](#2-table-naming-conventions)
  - [2.1 Bronze Rules](#21-bronze-rules)
  - [2.2 Silver Rules](#22-silver-rules)
  - [2.3 Gold Rules](#23-gold-rules)
    - [2.3.1 Glossary of Category Patterns](#231-glossary-of-category-patterns)
- [3. Column Naming Conventions](#3-column-naming-conventions)
  - [3.1 Surrogate Keys](#31-surrogate-keys)
  - [3.2 Technical Columns](#32-technical-columns)
- [4. Stored Procedure Naming Conventions](#4-stored-procedure-naming-conventions)

---

## 1. **General Principles**

- **Naming Conventions**: Use snake_case, with lowercase letters and underscores (`_`) to separate words.
- **Language**: Use English for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words as object names.

---

## 2. **Table Naming Conventions**

### 2.1 **Bronze Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### 2.2 **Silver Rules**
- All names must start with the source system name, and table names must match their original names without renaming.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
  - Example: `crm_customer_info` → Customer information from the CRM system.

### 2.3 **Gold Rules**
- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **`<category>_<entity>`**  
  - `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).  
  - `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).  
  - Examples:
    - `dim_customers` → Dimension table for customer data.  
    - `fact_sales` → Fact table containing sales transactions.  

#### 2.3.1 **Glossary of Category Patterns**

| Pattern     | Meaning         | Example(s)                              |
|-------------|------------------|-----------------------------------------|
| `dim_`      | Dimension table  | `dim_customer`, `dim_product`           |
| `fact_`     | Fact table       | `fact_sales`                            |
| `report_`   | Report table     | `report_customers`, `report_sales_monthly`   |

---

## 3. **Column Naming Conventions**

### 3.1 **Surrogate Keys**
- All primary keys in dimension tables must use the suffix `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Refers to the name of the table or entity the key belongs to.  
  - `_key`: A suffix indicating that this column is a surrogate key.  
  - Example: `customer_key` → Surrogate key in the `dim_customers` table.
  
### 3.2 **Technical Columns**
- All technical columns must start with the prefix `dwh_`, followed by a descriptive name indicating the column's purpose.
- **`dwh_<column_name>`**  
  - `dwh`: Prefix exclusively for system-generated metadata.  
  - `<column_name>`: Descriptive name indicating the column's purpose.  
  - Example: `dwh_load_date` → System-generated column used to store the date when the record was loaded.

---

## 4. **Stored Procedure Naming Conventions**

- All stored procedures used for loading data must follow the naming pattern:
- **`load_<layer>`**.  
  - `<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.
  - Example: 
    - `load_bronze` → Stored procedure for loading data into the Bronze layer.  
    - `load_silver` → Stored procedure for loading data into the Silver layer.

---

*This document can be expanded and refined as new data warehouse standards are adopted.*
