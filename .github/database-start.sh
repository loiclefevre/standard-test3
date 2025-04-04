#!/bin/bash

echo "Managing Oracle Autonomous Database..."
export INFO=$(curl -s -k -L -X GET "https://api.testpilot-controller.oraclecloud.com/ords/testpilot/admin/database?type=autonomous" -H 'accept: application/json')
export HOST=$(echo $INFO | jq -r '.database' | jq -r '.host')
export SERVICE=$(echo $INFO | jq -r '.database' | jq -r '.service')
export PASSWORD=$(echo $INFO | jq -r '.database' | jq -r '.password')

curl -s -X POST "https://${HOST}.oraclecloudapps.com/ords/admin/_/sql" -H 'content-type: application/sql' -H 'accept: application/json' -basic -u admin:${PASSWORD} --data-ascii "create user test_$RUNID identified by \"My_Password_4_Testing\" DEFAULT TABLESPACE DATA TEMPORARY TABLESPACE TEMP;alter user test_$RUNID quota unlimited on data;grant CREATE SESSION, RESOURCE, CREATE VIEW, CREATE SYNONYM, CREATE ANY INDEX, EXECUTE ANY TYPE to test_$RUNID;"
