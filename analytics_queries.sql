/*
================================================
 ANALYTICS & REPORTING QUERIES
 Author: Happy Uwineza (ID: 27829)
 Description:
   Useful insights for pharmacy management
================================================
*/

--------------------------------------------------
-- 1. LIST OF MEDICINES THAT ARE EXPIRED
--------------------------------------------------
SELECT 
    m.medicine_id,
    m.medicine_name,
    m.expiry_date,
    is_expired(m.expiry_date) AS expiry_status
FROM medicines m
WHERE m.expiry_date < CURRENT_DATE
ORDER BY expiry_date ASC;


--------------------------------------------------
-- 2. MEDICINES NEAR EXPIRY (≤ 30 days)
--------------------------------------------------
SELECT 
    m.medicine_id,
    m.medicine_name,
    m.expiry_date,
    is_near_expiry(m.expiry_date) AS near_expiry_status
FROM medicines m
WHERE m.expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY expiry_date ASC;


--------------------------------------------------
-- 3. MEDICINES WITH LOW STOCK
--------------------------------------------------
SELECT
    m.medicine_id,
    m.medicine_name,
    m.quantity,
    m.min_stock_level,
    stock_status(m.quantity, m.min_stock_level) AS stock_status
FROM medicines m
WHERE m.quantity <= m.min_stock_level
ORDER BY quantity ASC;


--------------------------------------------------
-- 4. TOTAL MEDICINES PER CATEGORY
--------------------------------------------------
SELECT 
    c.category_name,
    COUNT(m.medicine_id) AS total_medicines
FROM categories c
LEFT JOIN medicines m 
    ON c.category_id = m.category_id
GROUP BY c.category_name
ORDER BY total_medicines DESC;


--------------------------------------------------
-- 5. MOST STOCKED MEDICINES
--------------------------------------------------
SELECT 
    medicine_name,
    quantity
FROM medicines
ORDER BY quantity DESC
LIMIT 10;


--------------------------------------------------
-- 6. MEDICINES EXPIRING THIS MONTH
--------------------------------------------------
SELECT
    medicine_name,
    expiry_date
FROM medicines
WHERE DATE_TRUNC('month', expiry_date) = DATE_TRUNC('month', CURRENT_DATE)
ORDER BY expiry_date ASC;


--------------------------------------------------
-- 7. INVENTORY SUMMARY REPORT
--------------------------------------------------
SELECT
    COUNT(*) AS total_medicines,
    SUM(quantity) AS total_units_in_stock,
    SUM(CASE WHEN expiry_date < CURRENT_DATE THEN 1 ELSE 0 END) AS expired_items,
    SUM(CASE WHEN expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days' THEN 1 ELSE 0 END) AS near_expiry_items,
    SUM(CASE WHEN quantity <= min_stock_level THEN 1 ELSE 0 END) AS low_stock_items
FROM medicines;
