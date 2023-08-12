cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export BUCKET=gs://${PROJECT_ID}
export PIPELINE_FOLDER=${BUCKET}
export RUNNER=DataflowRunner
export PUBSUB_TOPIC=projects/${PROJECT_ID}/topics/my_topic
export WINDOW_DURATION=60
export AGGREGATE_TABLE_NAME=${PROJECT_ID}:logs.windowed_minute_traffic
export RAW_TABLE_NAME=${PROJECT_ID}:logs.raw_streaming
python Quest-DataProcessing/Quest-3-Streaming-Pipeline/minute_traffic_pipeline.py \
--project=${PROJECT_ID} \
--region=${REGION} \
--staging_location=${PIPELINE_FOLDER}/staging \
--temp_location=${PIPELINE_FOLDER}/temp \
--runner=${RUNNER} \
--input_topic=${PUBSUB_TOPIC} \
--window_duration=${WINDOW_DURATION} \
--agg_table_name=${AGGREGATE_TABLE_NAME} \
--raw_table_name=${RAW_TABLE_NAME}