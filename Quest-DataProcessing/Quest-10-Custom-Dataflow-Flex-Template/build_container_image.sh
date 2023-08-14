cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

export PROJECT_ID=$(gcloud config get-value project)
export TEMPLATE_IMAGE="gcr.io/$PROJECT_ID/dataflow/branching_pipeline:latest"
gcloud builds submit --tag $TEMPLATE_IMAGE .