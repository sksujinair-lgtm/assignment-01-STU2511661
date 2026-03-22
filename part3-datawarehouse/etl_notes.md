## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem: The dataset contained inconsistent date formats.
Resolution: All dates were converted into a standard YYYY-MM-DD format.

### Decision 2 — Handling NULL Values
Problem: Some rows had missing values in important fields.
Resolution: Rows with missing critical values were either cleaned or excluded.

### Decision 3 — Fixing Category Casing
Problem: Product categories had inconsistent casing (e.g., electronics, ELECTRONICS).
Resolution: All category values were standardized to proper case (e.g., Electronics).
