cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

#Delete file
rm testing_streaming.out

#Run Pipeline 
python Quest-DataProcessing/Quest-9-Streaming-Testing-Pipeline/taxi_rides_pipeline_test.py

#View Output
cat Quest-DataProcessing/Quest-9-Streaming-Testing-Pipeline/testing_streaming.out

#Copy Output to Google Cloud Storage
export PROJECT_ID=$(gcloud config get-value project)
gsutil cp Quest-DataProcessing/Quest-9-Streaming-Testing-Pipeline/testing_streaming.out gs://$PROJECT_ID/Streaming_Testing_Pipeline/