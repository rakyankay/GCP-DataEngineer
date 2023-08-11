echo "Copying events to Cloud Storage"

# Set BUCKET to the non-coldline Google Cloud Storage bucket
export BUCKET=gs://$(gcloud config get-value project)/

# Copy events.json into the bucket
gsutil cp events.json ${BUCKET}