# Data Warehouse and Analytics Project

# Setting Up the Environment

This project uses Docker to deploy a PostgreSQL database in a containerized environment.  
The following steps describe how the environment was created and how it connects to PgAdmin for database management.

===================================================================================

## 1 -  Creating the Docker Container for PostgreSQL

We created a PostgreSQL container using the following command:  
* docker run --name sql_data_warehouse_project -p 5433:5432 \ -e POSTGRES_USER=user name \ -e POSTGRES_PASSWORD=password \ -e POSTGRES_DB=sql_data_warehouse_project \ -v my_pgdata:/var/lib/postgresql/data \ -d postgres:16.1

Here’s a breakdown of the command:

* docker volume create my_pgdata — creates a named volume to persist PostgreSQL data.

* --name sql_data_warehouse_project — names the container for easy reference.

* -p 5433:5432 — maps host port 5433 to container port 5432 (the default PostgreSQL port).

* -e POSTGRES_USER= user here — sets the database superuser.

* -e POSTGRES_PASSWORD= password here — sets the password for the superuser.

* -e POSTGRES_DB=sql_data_warehouse_project — automatically creates the database if it does not already exist (note: this only works when the data volume is empty).

* -v my_pgdata:/var/lib/postgresql/data — mounts the volume to persist database data.

* -d postgres:16.1 — specifies the PostgreSQL image version.

================================================================================

## 2 - Connecting to PostgreSQL via PgAdmin

To manage and interact with the database, we use PgAdmin. The steps to establish the connection are:  

1. Open PgAdmin in your browser (typically at http://localhost:5050 or whichever port you configured).

2. In the left panel, right-click on Servers and select Create > Server...

3. In the General tab, set a name for the connection, e.g., SQL_DW_Project.

4. In the Connection tab, fill in:

    . Host name/address: *localhost*

    . Port: 5433 => *the port you configured*

    . Maintenance database: *sql_data_warehouse_project*

    . Username: *user name here*

    . Password: *password here*

5. Save the configuration and connect.

==================================================================================

## 3 - Schema Creation in PostgreSQL

After establishing the connection, we manage the database structure via SQL scripts executed in PgAdmin’s Query Tool. The typical workflow includes:
* Creating the required schemas (bronze, silver, and gold).
* Creating the tables.

==================================================================================

## Final Notes
This setup ensures a consistent, reproducible environment for data warehousing development using Docker and PostgreSQL.   

The separation of schemas (bronze, silver, gold) follows the data lakehouse or medallion architecture approach, facilitating clear data organization and transformation stages.  

