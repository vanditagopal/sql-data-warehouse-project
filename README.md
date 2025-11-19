
# 📦 SQL Data Warehouse From Scratch

### *End-to-End Hands-On Data Engineering Project (Following “SQL Data Warehouse From Scratch | Data With Baraa”)*

This project is a complete implementation of a **modern SQL Data Warehouse** using a **multi-layer Lakehouse-style architecture** (Bronze → Silver → Gold).
It follows the structure taught in the *Data With Baraa* end-to-end tutorial, recreated fully from scratch to solidify real-world data engineering concepts.

This repository demonstrates **how raw operational data is transformed into analytics-ready, business-friendly datasets** using SQL Server, SSMS, and ETL processes.

---

## 🚀 1. Project Overview

The primary objective of this project was to understand and implement:

* Multi-layer data architecture (Bronze/Silver/Gold)
* Data ingestion, cleaning, modeling, and warehouse design
* Star schema modeling for analytics
* End-to-end ETL lifecycle
* Practical SQL data engineering workflows

By following the tutorial hands-on, I built a functional data warehouse that simulates how enterprise teams build scalable reporting systems.

---

# 🏗️ 2. Architecture Overview (Bronze → Silver → Gold)

To reflect modern data engineering best practices, the project uses a **three-layered architecture**:

---

### 🥉 **Bronze Layer (Raw Layer)**

* Contains **raw data exactly as received** from the source files (CSV/flat files).
* No cleaning or transformations.
* Acts as the immutable *source of truth*.
* Mirrors the Landing/Staging concept in SQL Server.

**Key Purpose:**
Store raw, unaltered data for reproducibility, audits, and debugging.

---

### 🥈 **Silver Layer (Cleaned & Standardized Layer)**

* Data is cleaned, validated, and standardized.
* Data types fixed, NULL values handled, duplicates removed.
* Conformed datasets prepared for modeling.
* Equivalent to the curated staging tables in traditional warehousing.

**Key Purpose:**
Produce reliable, consistent datasets suitable for analytics modeling.

---

### 🥇 **Gold Layer (Business-Ready Warehouse Layer)**

* Fully modeled star schema for analytics.
* Contains **Dimension Tables** (DimCustomer, DimProduct, etc.)
* Contains **Fact Tables** (FactSales, etc.)
* Optimized for reporting tools and BI consumption.

**Key Purpose:**
Deliver business-ready data supporting dashboards, KPIs, and advanced analytics.

---

# 🧱 3. Data Warehouse Schema

The Gold layer is modeled using a **Star Schema**, ensuring:

* Fast analytical queries
* Clear separation of descriptive vs. transactional data
* High usability for BI/analytics teams

### **Dimension Tables Include:**

* DimCustomer
* DimProduct

### **Fact Tables Include:**

* FactSales 

---

# 🔄 4. ETL Pipeline (End-to-End Flow)

The project includes a full ETL cycle:

### **1. Extract**

* Load CSV files into Bronze layer
* Automatically detect schema & types
* Store raw records unchanged

### **2. Transform**

Processing done in the Silver layer:

* Data cleaning
* Removing duplicates
* Type conversions
* Standardizing codes
* Integrity checks

### **3. Load**

Gold Layer:

* Populate Dimension tables (with surrogate keys)
* Populate Fact tables referencing dimensions
* Apply incremental logic (if applicable)

This workflow reflects real-world data engineering patterns used across enterprises.

---

# 🔧 5. Tools & Technologies Used

Exactly as used in the Data With Baraa tutorial:

* **Microsoft SQL Server**
* **SQL Server Management Studio (SSMS)**
* **T-SQL** for transformations
* **Flat files / CSVs** as source input
* **ETL logic implemented manually or via SSIS**
* **Star Schema modeling**

---

# 🎓 6. What I Learned

This project significantly strengthened my foundations in data engineering:

### 📌 **Data Architecture & Modeling**

* Understanding multi-layer systems: Bronze, Silver, Gold
* Importance of separating raw and cleaned data
* How star schemas improve analytical efficiency
* Designing dimension & fact tables

### 📌 **ETL Concepts**

* Extracting from unstructured/semistructured sources
* Data cleaning & standardization
* Handling NULLs, bad records, and duplicates
* Deduplication & basic data quality rules
* Incremental vs full data loads

### 📌 **SQL Engineering**

* Writing production-grade T-SQL
* Using constraints, indexes, and keys
* Creating schemas and database layers
* Joining, aggregating, and transforming large datasets

### 📌 **Real-World Thinking**

* Ensuring data lineage and traceability
* Designing maintainable, scalable pipelines
* Understanding how data moves across layers
* Building systems that Business Intelligence teams rely on


