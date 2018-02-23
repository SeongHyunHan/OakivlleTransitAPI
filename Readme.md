Oakville Transit API

SETTING LOCAL DB
1.node .
2.psql -h [dbUrl] -p [dbPort] -d [dbSchema] -U [dbUsername] -a -f 1_create_table.sql
3.psql -h [dbUrl] -p [dbPort] -d [dbSchema] -U [dbUsername] -a -f 2_add_table.sql 