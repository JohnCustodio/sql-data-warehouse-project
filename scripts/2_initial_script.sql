-- Initial Data Project Script – PostgreSQL with Docker
/*
* Purpose
This SQL script is part of the initial setup for a data environment using PostgreSQL running in a Docker container. It creates base schemas to organize data into layers: bronze, silver, and gold.

* Environment
Database: PostgreSQL
Execution: Docker container
Access: Clients like PgAdmin via a mapped port (e.g., 5433, 5434...)
*/
-- ========================================================================

-- Database Creation
/*
Note: PostgreSQL does not allow dropping the database you're currently connected to (e.g., in PgAdmin).
To handle this:

Connect to the default postgres database (available by default in Docker).
Run commands to drop and recreate your target database.
In PgAdmin, manually switch to the newly created database.

=> This step is optional and intended for scenarios where you want to fully automate the environment setup using SQL.
*/
-- ========================================================================

-- Schema Creation
-- Create schemas to organize data layers
/*
Benefits:
Clear and consistent data layer organization
Easy setup replication across different environments
Aligns with modern data architecture best practices (e.g., Data Lakehouse)
*/
  
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
