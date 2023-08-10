echo "Creating pipeline sinks"

PROJECT_ID=$(gcloud config get-value project)

# GCS buckets
gsutil mb -l US gs://$PROJECT_ID
gsutil mb -l US -c "COLDLINE" gs://$PROJECT_ID-coldline

# BiqQuery Dataset
bq mk --location=US logs