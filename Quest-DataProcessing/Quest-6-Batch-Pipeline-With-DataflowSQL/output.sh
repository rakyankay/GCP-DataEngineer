#Check Transform Data on Big Query
bq head -n 10 logs.user_traffic_agg

#Check Raw Data on Big Query
bq head -n 10 logs.user_traffic_sql