------------------------------------------------------------
--  SCHEMA: Medicine Inventory & Expiry Alert System
--  AUTHOR: Uwineza Happy (ID: 27829)
--  DESCRIPTION:
--     Contains all CREATE TABLE statements required for the
--     Medicine Inventory & Expiry Monitoring Database Project.
------------------------------------------------------------

-- Drop tables if they exist (safe re-run)
DROP TABLE MEDICINE_INVENTORY CASCADE CONSTRAINTS;
DROP TABLE ALERT_LOG CASCADE CONSTRAINTS;

------------------------------------------------------------
-- 1. MEDICINE_INVENTORY TABLE
--    Stores all medicine information including expiry date.
------------------------------------------------------------
CREATE TABLE MEDICINE_INVENTORY (
    MEDICINE_ID       NUMBER PRIMARY KEY,
    MEDICINE_NAME     VARCHAR2(100) NOT NULL,
    CATEGORY          VARCHAR2(50),
    MANUFACTURER      VARCHAR2(100),
    QUANTITY          NUMBER DEFAULT 0,
    PURCHASE_DATE     DATE,
    EXPIRY_DATE       DATE NOT NULL,
    STATUS            VARCHAR2(20)   -- 'EXPIRED', 'EXPIRING_SOON', 'VALID'
);

------------------------------------------------------------
-- 2. ALERT_LOG TABLE
--    Stores alerts when medicines expire / near expiry.
------------------------------------------------------------
CREATE TABLE ALERT_LOG (
    ALERT_ID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    MEDICINE_ID    NUMBER NOT NULL,
    ALERT_MESSAGE  VARCHAR2(255),
    ALERT_DATE     DATE DEFAULT SYSDATE,
    FOREIGN KEY (MEDICINE_ID) REFERENCES MEDICINE_INVENTORY(MEDICINE_ID)
);
