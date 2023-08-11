cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export REGION='us-central1'
export BUCKET=gs://${PROJECT_ID}
export COLDLINE_BUCKET=${BUCKET}-coldline
export PIPELINE_FOLDER=${BUCKET}
export RUNNER=DataflowRunner
export INPUT_PATH=${PIPELINE_FOLDER}/events.json
export OUTPUT_PATH=${COLDLINE_BUCKET}/pipeline_output
export TABLE_NAME=${PROJECT_ID}:logs.bytes_filtered
python $BASE_DIR/Quest-DataProcessing/Quest-4-Branching-Pipeline/branching_pipeline.py \
--project=${PROJECT_ID} \
--region=${REGION} \
--stagingLocation=${PIPELINE_FOLDER}/staging \
--tempLocation=${PIPELINE_FOLDER}/temp \
--runner=${RUNNER} \
--inputPath=${INPUT_PATH} \
--outputPath=${OUTPUT_PATH} \
--tableName=${TABLE_NAME}