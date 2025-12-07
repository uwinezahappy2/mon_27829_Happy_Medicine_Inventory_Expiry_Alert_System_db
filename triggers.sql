------------------------------------------------------------
-- TRIGGER: AUTO-UPDATE MEDICINE STATUS ON INSERT/UPDATE
-- Author: Uwineza Happy (ID: 27829)
-- Purpose: Automatically update STATUS based on EXPIRY_DATE
------------------------------------------------------------

CREATE OR REPLACE TRIGGER trg_update_medicine_status
BEFORE INSERT OR UPDATE ON MEDICINE_INVENTORY
FOR EACH ROW
BEGIN
    -- If expiry date has passed
    IF :NEW.EXPIRY_DATE < SYSDATE THEN
        :NEW.STATUS := 'EXPIRED';

    -- If expiry date is within 30 days
    ELSIF :NEW.EXPIRY_DATE BETWEEN SYSDATE AND (SYSDATE + 30) THEN
        :NEW.STATUS := 'NEAR EXPIRY';

    -- Otherwise, medicine is still valid
    ELSE
        :NEW.STATUS := 'VALID';
    END IF;
END;
/

