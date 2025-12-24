# Data Dictionary for Gold Layer
## Overview
The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases.
It consistes of dimension and fact tables for specific business metrics.
______________________________________________________________________________________________________________________

1) **Table**: gold.dim_customers
  - Purpose: Store customer details enriched with demographic and geographic data
  - Columns

| Column Name | Data Type | Description |
| :----------- |:--------------|:-------------|
| customer_key       | INT              | Surrogate key uniquely identifying each customer record in the dimension table |
| customer_id        | INT              | A Unique numercial identifier assigned to each customer |
| customer_number    | NVARCHAR(50)     | A Alphanumeric identifier representing the customer, used for tracking and referencing |
| first_name         | NVARCHAR(50)     | The customer's first name, as recorded in the system |
| last_name          | NVARCHAR(50)     | The customer's last name or family name |
| country            | NVARCHAR(50)     | The country of residence for the customer (e.g., 'Australia') |
| marital_status     | NVARCHAR(50)     | The marital status of the customer (e.g., 'Married') |
| gender             | NVARCHAR(50)     | THe gender of the customer (e.g., 'Male', 'n/a') |
| birthdate          | DATE             | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06) |
| create_date        | DATE             | The date and time when the customer record was created in the system |

______________________________________________________________________________________________________________________

2) **Table**: gold.dim_products
  - Purpose: Provide information about the products and their attributes
  - Columns:

| Column Name | Data Type | Description |
| :----------- |:--------------|:-------------|
| product_key           | INT            | Surrogate key uniquely identifying each product record in the product dimension table |
| product_id            | INT            | A unique identifier assigned to the product for internal tracking and referencing |
| product_number        | NVARCHAR(50)   | A structured alphanumerical code representing the product, often used for categorization and inventory|
| product_name          | NVARCHAR(50)   | Descriptive name of the product, including details such as type, color, and size |         
| category_id           | NVARCHAR(50)   | A unique identifier for the product's category, linking to its high-level classification |
| category              | NVARCHAR(50)   | The broader classification of the product (e.g., Bikes, Component) to group related items|
| subcategory           | NVARCHAR(50)   | A more detailed classification of the product within the category, such as product type|
| maintenance_required  | NVARCHAR(50)   | Indicate whether the product requires maintenance (e.g., 'Yes', 'No')|
| cost                  | INT            | The cost or base price of the product, measured in monetary units|
| product_line          | NVARCHAR(50)   | The specific product line or series to which the product belongs (e.g., Road, Mountain)|
| start_date            | Date           | The date when the product became available for sale or use|

______________________________________________________________________________________________________________________

