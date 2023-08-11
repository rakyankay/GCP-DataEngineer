bq query --use_legacy_sql=false \
'SELECT
   *
 FROM
   `logs.user_traffic`
 LIMIT 100'