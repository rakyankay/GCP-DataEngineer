export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export JOB_NAME=mytemplate-$(date +%Y%m%H%M$S)
export TEMPLATE_LOC=gs://${PROJECT_ID}/templates/mytemplate.json
export INPUT_PATH=gs://${PROJECT_ID}/events.json
export OUTPUT_PATH=gs://${PROJECT_ID}-coldline/template_output/
export BQ_TABLE=${PROJECT_ID}:logs.logs_filtered
gcloud beta dataflow flex-template run ${JOB_NAME} \
  --region=$REGION \
  --template-file-gcs-location ${TEMPLATE_LOC} \
  --parameters "inputPath=${INPUT_PATH},outputPath=${OUTPUT_PATH},tableName=${BQ_TABLE}"