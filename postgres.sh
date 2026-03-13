#Backup
kubectl exec -n dev next-db-edms-postgresql-0 -- bash -c 'export PGPASSWORD="" && pg_dumpall -c -U postgres' > next-db-edms.sql

#Restore
kubectl exec -n dev next-db-edms-postgresql-0 -- bash -c 'export PGPASSWORD="" && psql -U postgres' < next-db-edms.sql

#local restore
export PGPASSWORD="" && psql -h 10.16.32.246 -p 31501 -U postgres < next-db-edms.sql
