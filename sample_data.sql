------------------------------------------------------------
-- SAMPLE DATA FOR MEDICINE INVENTORY SYSTEM
-- Inserts sample records into MEDICINE_INVENTORY table
-- Author: Uwineza Happy (ID: 27829)
------------------------------------------------------------

-- Clear existing data (optional)
DELETE FROM MEDICINE_INVENTORY;
COMMIT;

------------------------------------------------------------
-- Insert sample medicines
------------------------------------------------------------

INSERT INTO MEDICINE_INVENTORY (
    MEDICINE_ID, MEDICINE_NAME, CATEGORY, MANUFACTURER, QUANTITY,
    PURCHASE_DATE, EXPIRY_DATE, STATUS
) VALUES (
    1, 'Paracetamol 500mg', 'Painkiller', 'KLab Pharma', 120,
    DATE '2024-01-10', DATE '2024-12-30', 'VALID'
);

INSERT INTO MEDICINE_INVENTORY (
    MEDICINE_ID, MEDICINE_NAME, CATEGORY, MANUFACTURER, QUANTITY,
    PURCHASE_DATE, EXPIRY_DATE, STATUS
) VALUES (
    2, 'Amoxicillin 250mg', 'Antibiotic', 'Rwanda Medical Supply', 75,
    DATE '2024-03-05', DATE '2025-02-15', 'VALID'
);

INSERT INTO MEDICINE_INVENTORY (
    MEDICINE_ID, MEDICINE_NAME, CATEGORY, MANUFACTURER, QUANTITY,
    PURCHASE_DATE, EXPIRY_DATE, STATUS
) VALUES (
    3, 'Cough Syrup', 'Cold & Flu', 'PharmaPlus Ltd', 50,
    DATE '2023-10-01', DATE '2024-09-01', 'EXPIRED'
);

INSERT INTO MEDICINE_INVENTORY (
    MEDICINE_ID, MEDICINE_NAME, CATEGORY, MANUFACTURER, QUANTITY,
    PURCHASE_DATE, EXPIRY_DATE, STATUS
) VALUES (
    4, 'Vitamin C Tablets', 'Supplement', 'HEALTHLAB', 200,
    DATE '2024-06-12', DATE '2025-12-31', 'VALID'
);

INSERT INTO MEDICINE_INVENTORY (
    MEDICINE_ID, MEDICINE_NAME, CATEGORY, MANUFACTURER, QUANTITY,
    PURCHASE_DATE, EXPIRY_DATE, STATUS
) VALUES (
    5, 'Insulin', 'Diabetes', 'BioPharm', 30,
    DATE '2024-01-20', DATE '2024-10-25', 'EXPIRED'
);

COMMIT;
