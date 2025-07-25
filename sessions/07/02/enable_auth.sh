#!/bin/bash
set -e

# Modify cassandra.yaml
sed -i 's/authenticator: AllowAllAuthenticator/authenticator: PasswordAuthenticator/' /etc/cassandra/cassandra.yaml
sed -i 's/authorizer: AllowAllAuthorizer/authorizer: CassandraAuthorizer/' /etc/cassandra/cassandra.yaml

# Start Cassandra normally
exec docker-entrypoint.sh "$@"