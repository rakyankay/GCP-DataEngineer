cd /home/jupyter/GCP-DataEngineerLearningPath/
export BASE_DIR=$(pwd)

#Delete file
rm testing.out

#Run Pipeline 
python Quest-DataProcessing/Quest-8-Batch-Testing-Pipeline/weather_stats_pipeline_test.py

#View Output
cat testing.out

#Copy Output to Google Cloud Storage
export PROJECT_ID=$(gcloud config get-value project)
cd Quest-DataProcessing/Quest-8-Batch-Testing-Pipeline
gsutil cp testing.out gs://$PROJECT_ID/Batch_Testing_Pipeline/