# Create a new user with cqlsh

cqlsh> 
    CREATE USER 'username' 
    WITH PASSWORD 'password' 
    NOSUPERUSER / SUPERUSER;

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

cqlsh> GRANT select ON test.t TO rayan;
cqlsh> REVOKE select on test.t FROM rayan;





