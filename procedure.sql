-- Procedure: Batch Expiry Check
CREATE OR REPLACE PROCEDURE CHECK_ALL_EXPIRY IS
BEGIN
    FOR med IN (
        SELECT MEDICINE_ID, NAME, EXPIRY_DATE
        FROM MEDICINES
        WHERE EXPIRY_DATE <= SYSDATE + 30
    ) LOOP
        INSERT INTO ALERTS (ALERT_ID, MEDICINE_ID, ALERT_TYPE, ALERT_MESSAGE)
        VALUES (
            ALERTS_SEQ.NEXTVAL,
            med.MEDICINE_ID,
            'EXPIRY',
            'Medicine "' || med.NAME || '" is expiring on ' || TO_CHAR(med.EXPIRY_DATE,'DD-MON-YYYY')
        );
    END LOOP;
END;
/

-- Run Procedure
BEGIN
    CHECK_ALL_EXPIRY;
END;
/
