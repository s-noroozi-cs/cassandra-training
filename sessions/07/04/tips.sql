# Create a new user with cqlsh

cqlsh> 
    CREATE USER 'username' 
    WITH PASSWORD 'password' 
    NOSUPERUSER / SUPERUSER;

cqlsh> ALTER USER username WITH PASSWORD 'new-password';

cqlsh> LIST USERS;

cqlsh> ROP USER [ IF EXISTS ] user_name / role_name

# Create following keyspace and table using user cassandra;
cqlsh>
    CREATE KEYSPACE test 
    WITH replication = {
        'class': 'SimpleStrategy', 
        'replication_factor': 1
    };
cqlsh>create table test.t (id text PRIMARY KEY );
cqlsh>INSERT INTO test.t (id ) VALUES ( '1');

#Switch to our new created user
# try to select and see something like this

#   Unauthorized: Error from server: code=2100 [Unauthorized] 
    message=
        "User x has no y permission on <table z> or any of its parents"

# add grant to user and try it again    

cqlsh> GRANT select ON keyspace.table TO rayan;
cqlsh> REVOKE select on keyspace.table FROM rayan;


-----------------------------------------------------------------

# define role and add all required roles, then assign to user
# this is called RBAC: Role-Based Access Control

cqlsh> CREATE ROLE 'role_name';
cqlsh> GRANT SELECT ON keyspace.table TO role_name;
cqlsh> GRANT role_name TO 'username';
cqlsh> REVOKE role_name FROM 'username';

-----------------------------------------------------------------

cqlsh> LIST ROLES;


Key Differences Between Roles and Users
-----------------------------------------------------------------------
Feature	            Traditional Users	            Roles
Authentication	    Username/password only	        Can represent both users and groups
Authorization	    Direct permissions only	        Inheritable permissions
Structure	        Flat hierarchy	                Hierarchical (role inheritance)
Flexibility     	Limited	                        Can represent service accounts, groups, or individuals


Roles as Users
--------------------------------------------------
cqlsh> CREATE ROLE web_app 
        WITH PASSWORD = 'secure123' 
        AND LOGIN = true;


Roles as Groups
--------------------------------------------------
cqlsh> CREATE ROLE analytics_team 
        WITH LOGIN = false;


Inheritance
--------------------------------------------------
cqlsh> GRANT analytics_team TO data_scientist;



Creating a Login Role (User)
--------------------------------------------------
cqlsh> CREATE ROLE dba 
        WITH PASSWORD = 'dbapass' 
        AND LOGIN = true 
        AND SUPERUSER = true;



Creating a Group Role
--------------------------------------------------
cqlsh> CREATE ROLE read_only_users;
cqlsh> GRANT SELECT ON ALL KEYSPACES TO read_only_users;



Assigning Group Membership
--------------------------------------------------
cqlsh> CREATE ROLE dba_L1 
        WITH PASSWORD = 'dba_L1' 
        AND LOGIN = true;
cqlsh> GRANT read_only_users TO dba_L1;




Permission Management
--------------------------------------------------
-- Grant table access
cqlsh> GRANT SELECT ON KEYSPACE retail TO inventory_reader;

-- Revoke permissions
cqlsh> REVOKE ALL PERMISSIONS ON KEYSPACE retail FROM inventory_reader;

-- View permissions
cqlsh> LIST ALL PERMISSIONS OF inventory_reader;



Role Hierarchies
--------------------------------------------------
cqlsh> GRANT department_lead TO team_lead;
cqlsh> GRANT team_lead TO staff_member;



Best Practices
--------------------------------------------------
1. Use roles for applications: 
    
    cqlsh> CREATE ROLE inventory_service 
            WITH PASSWORD = 'svcpass'

2. Create functional groups: 
    finance_team, 
    dev_ops

3. Limit SUPERUSER roles

4. Regularly audit permissions with 
    cqlsh> LIST ROLES
    cqlsh> LIST PERMISSIONS









