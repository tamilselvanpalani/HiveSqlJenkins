#!/bin/sh
FILE=/root/hive_scripts/select.properties
db_name=$(grep -i 'databaseName' $FILE  | cut -f2 -d'=')
table_name=$(grep -i 'tableName' $FILE  | cut -f2 -d'=')
echo "connecting to database - " $db_name
echo  "using table - " $table_name
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME=$table_name -S -f /root/hive_scripts/select.hql | sed 's/[\t]/,/g' > /root/data_out/iris_`date '+%Y-%m-%d':'%H%M%S'`.csv
echo "hive query result is available ---> /root/data_out/"
