## Anomaly Analysis

### Insert Anomaly
In the dataset, a new product cannot be added unless an order exists because product details (product_id, product_name, category, unit_price) are stored along with order_id.

For example:
There is no way to insert a new product like (product_id = P999, product_name = "New Item") unless we create a row with an order_id.

Columns involved:
product_id, product_name, category, unit_price, order_id

---

### Update Anomaly
Customer details are repeated across multiple rows. Updating customer information in one row but not others leads to inconsistency.

For example:
customer_id = CUST1001 appears in multiple rows such as:
- Row with order_id = ORD1027
- Row with order_id = ORD1002

If customer_email is updated in one row but not the other, inconsistent data will exist.

Columns involved:
customer_id, customer_name, customer_email, customer_city

---

### Delete Anomaly
Deleting an order can result in loss of important customer or product data.

For example:
If the row with order_id = ORD1027 is deleted and that is the only record for that customer or product, then:
- Customer details (customer_id, customer_name, etc.)
- Product details (product_id, product_name)

will also be lost.

Columns involved:
order_id, customer_id, product_id



## Normalization Justification

The argument that keeping all data in a single table is simpler may seem valid initially, but in practice it leads to significant data management issues. The given dataset clearly demonstrates problems such as redundancy, inconsistency, and data loss risks.

For example, customer details like customer_name and customer_email are repeated across multiple rows for every order they place. If a customer such as CUST1001 appears in multiple orders and their email needs to be updated, the update must be made in all rows. Missing even one row leads to inconsistent data, which is a classic update anomaly.

Similarly, product information such as product_name and unit_price is duplicated across multiple rows. If the price of a product changes, it must be updated everywhere. This increases maintenance effort and risk of incorrect reporting.

Another major issue is delete anomaly. If a row corresponding to an order is deleted and that row contains the only record of a customer or product, all associated information is lost. This is undesirable as customer and product data should exist independently of transactions.

Normalization resolves these issues by separating data into logical tables such as Customers, Products, Orders, and Order_Items. This eliminates redundancy, ensures consistency, and allows independent insertion, update, and deletion of data.

Therefore, normalization is not over-engineering but a necessary step for ensuring data integrity, scalability, and maintainability in real-world systems.
