cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export BUCKET=gs://${PROJECT_ID}
export PIPELINE_FOLDER=${BUCKET}
export RUNNER=DataflowRunner
export INPUT_PATH=${PIPELINE_FOLDER}/events.json
export AGGREGATE_TABLE_NAME=${PROJECT_ID}:logs.user_traffic_agg
export RAW_TABLE_NAME=${PROJECT_ID}:logs.user_traffic_sql
python Quest-DataProcessing/Quest-6-Batch-Pipeline-With-DataflowSQL/user_traffic_sql_pipeline.py \
--project=${PROJECT_ID} \
--region=${REGION} \
--staging_location=${PIPELINE_FOLDER}/staging \
--temp_location=${PIPELINE_FOLDER}/temp \
--runner=${RUNNER} \
--experiments=use_runner_v2 \
--input_path=${INPUT_PATH} \
--agg_table_name=${AGGREGATE_TABLE_NAME} \
--raw_table_name=${RAW_TABLE_NAME}