# Data Warehouse Project
Building a modern data warehouse using medallion architecture with SQL server, including ETL, data modelling, and data analytics
- **Technology Stacks**: SQL Server, Power BI
- **Other tools**: Notion (Project Management), Draw.io (ER Diagram, System Architecture)
 
##  🌏Project Overview
  1) **Data Archetecture**: Design a modern data warehouse using medallion architecture Bronze, Silver, and Gold layers
  2) **ETL Pipelines**: Extracting, transforming, and loading data from sources systems into the data warehouse
  3) **Data Modeling**: Develop fact and dimension tables optmized for analytical queries
  4) **Analytics & Reporting**: Creating SQL-based report and dashboards for actionable insights

Skills:
- SQL Development (T-SQL)
- Data Architect
- Data Engineering
- ETL Pipeline Developer
- Data Modeling
- Data Analytics

##  ✅Project Requirements
### 1) Building the Data Warehouse (Medallion Architecture)

#### Tool : SQL Server

#### Objective
Develop a modern data warehouse using SQL server to consolidate sales data from different sources, resulting in analytical reporting and informed decision-making

#### Specifications
- **Data Sources**: Import data from 2 sources systems (ERP & CRM) provided as CSV files
- **Data Quality**: Cleanse and fix data quality issues
- **Integration**: Combine both data sources into a single, user-friendly data model designed for analytical queries
- **Scope**: Focus on latest dataset only; historization of data is not require (SCD type 1)
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams

### 2) BI: Analytics & Reporting

#### Tool : SQL Server

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

##  🏛️Data Architecture
The data architecture for this project follows **Medallion Architecture**: **Bronze**, **Silver**, and **Gold** layers.

![High-level medallion architecture](docs/png/High%20Level%20Architecture.drawio.png)
1) **Bronze Layer**: This layer stores raw data as-is from the source systems. Data is ingested from CSV files into SQL server database
2) **Silver Layer**: This layer stores data cleansing, standardization, and normalization process to prepare data for analysis
3) **Gold Layer**: This layer houses business-ready data modeled into a star schema required for reporting and analytics

## :diamond_shape_with_a_dot_inside:Data Flow Diagram (Data Lineage)
![Data Flow Diagram](/docs/png/Data%20flow%20diagram.drawio.png)

## ★Gold-Layer Data Model (Star Schema)
![Star Schema](/docs/png/Data%20Model%20of%20Star%20Schema.drawio.png)

## 🗂️Repository Structure
```
1) dataset/        # Raw datasets used for project (ERP and CRM data)
2) docs/           # Project documentation and architecture details
3) scripts/        # SQL scripts for ETL and transformation
4) tests/          # Test scripts and quality files
5) LICENSE         # License information for the repository
6) README.md       # Project overview and instructions
```

## 🛡️License
This project is licensed under the [MIT License](https://github.com/ChawinHong/Data-Warehouse-Medallion-Project/blob/main/LICENSE). You are free to use, modify, and share this project with proper attribution at your discretion


## ⭐About ME

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Chawin%20Hong-blue?logo=linkedin)](https://www.linkedin.com/in/chawinhong/)
