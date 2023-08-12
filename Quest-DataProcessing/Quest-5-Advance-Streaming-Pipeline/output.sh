#Check Streaming Data on Big Query
bq head logs.adv_minute_traffic

#Check Malformed Data on GCS
gsutil ls ${BUCKET}/deadletter
gsutil cat ${BUCKET}/deadletter/*