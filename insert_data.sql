-- Insert sample Suppliers
INSERT INTO SUPPLIERS VALUES (1, 'Health Pharma Ltd', '0788888888', 'contact@healthpharma.com');
INSERT INTO SUPPLIERS VALUES (2, 'MedLife Distributors', '0722222222', 'info@medlife.com');
INSERT INTO SUPPLIERS VALUES (3, 'Best Cure Supplies', '0733333333', 'sales@bestcure.com');

-- Insert sample Medicines
INSERT INTO MEDICINES VALUES (101, 'Paracetamol', TO_DATE('10-12-2025','DD-MM-YYYY'), 50, 40, 1);
INSERT INTO MEDICINES VALUES (102, 'Amoxicillin', TO_DATE('05-11-2025','DD-MM-YYYY'), 10, 20, 2);
INSERT INTO MEDICINES VALUES (103, 'Vitamin C', TO_DATE('20-01-2026','DD-MM-YYYY'), 5, 10, 3);
INSERT INTO MEDICINES VALUES (104, 'Ibuprofen', TO_DATE('01-12-2025','DD-MM-YYYY'), 100, 30, 1);

COMMIT;
