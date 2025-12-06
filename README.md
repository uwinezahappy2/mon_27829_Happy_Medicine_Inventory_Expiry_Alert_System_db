Medicine Inventory Expiry Alert System
A PL/SQL-Based Expiry Monitoring Project
 Overview

The Medicine Inventory Expiry Alert System is a PL/SQL-based project designed to help pharmacies and health centers track the expiry status of medicines.
It automatically generates alerts for medicines that are already expired or expiring soon, ensuring safety and proper inventory management.

The system uses:

Oracle Database

PL/SQL Stored Procedures

Triggers

Sequences

SQL Tables for storing medicine data

🗂️ Project Structure
Medicine_Inventory_Project/
│
├── create_tables.sql        -- Creates all required tables
├── create_sequence.sql      -- Creates sequence for MEDICINE_ID
├── insert_data.sql          -- Inserts sample medicine records
├── triggers.sql             -- Contains trigger to update expiry status
├── procedure.sql            -- Main PL/SQL procedure to check expired medicines
└── README.md                -- Documentation file

📥 1. Create Tables

This script creates the main table used in the project:

MEDICINE_INVENTORY
Includes:
MEDICINE_ID, MEDICINE_NAME, CATEGORY, QUANTITY, EXPIRY_DATE, STATUS.

Run:

@create_tables.sql

🔢 2. Create Sequence

Used to auto-increment medicine IDs.

@create_sequence.sql

📌 3. Insert Sample Data
@insert_data.sql


This data includes medicines that are:

Already expired

Expiring soon

Still safe

🔔 4. Trigger: Automatic Expiry Status Update

The trigger automatically updates the STATUS column whenever a medicine is inserted or updated.

Run:

@triggers.sql

🧠 5. Procedure: Expiry Alert Logic

This procedure checks all medicines and prints alerts in SQL Developer.

Run:

@procedure.sql

▶️ How to Run the Whole Project

Open SQL Developer

Connect to your database

Run all scripts in order:

@create_tables.sql
@create_sequence.sql
@insert_data.sql
@triggers.sql
@procedure.sql

📊 Output Example

When you run the procedure, you may see:

Medicine Paracetamol is expired!
Medicine Amoxicillin is expiring in 5 days!
No expired medicines found.

👩‍💻 Project Author

Uwineza Happy
Software Engineering Student
Adventist University of Central Africa (AUCA)