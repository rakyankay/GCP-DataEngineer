cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export BUCKET=gs://${PROJECT_ID}
export PIPELINE_FOLDER=${BUCKET}
export RUNNER=DataflowRunner
export PUBSUB_TOPIC=projects/${PROJECT_ID}/topics/my_topic
export WINDOW_DURATION=60
export ALLOWED_LATENESS=1
export OUTPUT_TABLE_NAME=${PROJECT_ID}:logs.adv_minute_traffic
export DEADLETTER_BUCKET=${BUCKET}
python Quest-DataProcessing/Quest-5-Advance-Streaming-Pipeline/streaming_malformed_data_pipeline.py \
--project=${PROJECT_ID} \
--region=${REGION} \
--staging_location=${PIPELINE_FOLDER}/staging \
--temp_location=${PIPELINE_FOLDER}/temp \
--runner=${RUNNER} \
--input_topic=${PUBSUB_TOPIC} \
--window_duration=${WINDOW_DURATION} \
--allowed_lateness=${ALLOWED_LATENESS} \
--table_name=${OUTPUT_TABLE_NAME} \
--dead_letter_bucket=${DEADLETTER_BUCKET} \
--allow_unsafe_triggers