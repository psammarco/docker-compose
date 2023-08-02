-- postgres container currently does not support multiple account creations
-- from variables in docker-compose.yaml.

-- Create postgres user 
CREATE USER postgres WITH PASSWORD 'postgres';

-- Make postgres a superuser
ALTER USER postgres WITH SUPERUSER;


-- Please exercise caution when assigning privileges, especially superuser-like privileges such as "REPLICATION" and "BYPASS RLS," as they grant significant power and control to the user. Only grant these privileges to trusted users who require them for specific purposes.

-- Grant the CREATE DATABASE privilege to the user
ALTER ROLE postgres WITH CREATEDB;

-- Grant the REPLICATION privilege to the user
ALTER ROLE postgres WITH REPLICATION;

-- Grant the BYPASS RLS privilege to the user
ALTER ROLE postgres WITH BYPASSRLS;
