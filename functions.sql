/*
==========================================
 FUNCTIONS FOR MEDICINE INVENTORY SYSTEM
 Author: Happy Uwineza (ID: 27829)
 Description:
   - Calculates expiry status
   - Flags near-expiry medicines
   - Computes stock availability
==========================================
*/

------------------------------------------
-- 1. FUNCTION: Check if medicine is expired
------------------------------------------
CREATE OR REPLACE FUNCTION is_expired(expiry_date DATE)
RETURNS VARCHAR(20)
AS $$
BEGIN
    IF expiry_date < CURRENT_DATE THEN
        RETURN 'Expired';
    ELSE
        RETURN 'Valid';
    END IF;
END;
$$ LANGUAGE plpgsql;


----------------------------------------------
-- 2. FUNCTION: Check if medicine is near expiry
-- Near expiry means ≤ 30 days from today
----------------------------------------------
CREATE OR REPLACE FUNCTION is_near_expiry(expiry_date DATE)
RETURNS VARCHAR(20)
AS $$
BEGIN
    IF expiry_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days' THEN
        RETURN 'Near Expiry';
    ELSE
        RETURN 'Not Near';
    END IF;
END;
$$ LANGUAGE plpgsql;


-----------------------------------------------------
-- 3. FUNCTION: Calculate remaining stock (safe level)
-- Returns: 'Low Stock' if quantity < minimum level
-----------------------------------------------------
CREATE OR REPLACE FUNCTION stock_status(quantity INT, min_level INT)
RETURNS VARCHAR(20)
AS $$
BEGIN
    IF quantity <= min_level THEN
        RETURN 'Low Stock';
    ELSE
        RETURN 'In Stock';
    END IF;
END;
$$ LANGUAGE plpgsql;
