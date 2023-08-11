cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export BUCKET=gs://${PROJECT_ID}
export PIPELINE_FOLDER=${BUCKET}
export RUNNER=DataflowRunner
export INPUT_PATH=${PIPELINE_FOLDER}/events.json
export TABLE_NAME=${PROJECT_ID}:logs.user_traffic

cd $BASE_DIR

python $BASE_DIR/Quest-DataProcessing/Quest-2-Batch-Pipeline/user_traffic_pipeline.py \
--project=${PROJECT_ID} \
--region=${REGION} \
--staging_location=${PIPELINE_FOLDER}/staging \
--temp_location=${PIPELINE_FOLDER}/temp \
--runner=${RUNNER} \
--input_path=${INPUT_PATH} \
--table_name=${TABLE_NAME}