#Check output on Table BigQuery
bq head logs.bytes_filtered

#Uncomment to check output on GCS
#gsutil cat -h ${COLDLINE_BUCKET}/pipeline_output*