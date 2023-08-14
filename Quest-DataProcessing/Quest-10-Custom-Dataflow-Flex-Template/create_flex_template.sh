export PROJECT_ID=$(gcloud config get-value project)
export TEMPLATE_PATH="gs://${PROJECT_ID}/templates/mytemplate.json"
# Will build and upload the template to GCS
# You may need to opt-in to beta gcloud features
gcloud beta dataflow flex-template build $TEMPLATE_PATH \
  --image "$TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "metadata.json"