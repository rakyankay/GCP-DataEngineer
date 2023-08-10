#Add imports
import argparse
import logging
import pandas as pd
import json
import apache_beam as beam
from apache_beam.dataframe import io
from apache_beam.options.pipeline_options import PipelineOptions
from apache_beam.options.pipeline_options import StandardOptions
from apache_beam.runners import DirectRunner

data_complete=[]

def parse_json(element):
    data = json.loads(element)
    
    if data.get('timestamp'):
        ip = str(data.get('ip'))
        user_id = str(data.get('user_id'))
        lat = data.get('lat')
        lng = data.get('user_id')
        timestamp = str(data.get('timestamp'))
        http_request = str(data.get('http_request'))
        http_response = data.get('http_response')
        num_bytes = data.get('num_bytes')
        user_agent = str(data.get('user_agent'))
        data_complete.append([ip,user_id, lat, lng, timestamp, http_request, http_response, num_bytes, user_agent])
    
    return data_complete

def process(siteTraffic):
    df = pd.DataFrame(
        siteTraffic, 
        columns = {'ip': str, 
                   'user_id': str, 
                   'lat': str,
                   'lng': str,
                   'timestamp': str,
                   'http_request': str,
                   'http_response': str,
                   'num_bytes': str,
                   'user_agent': str
        }
    )
    df.to_csv('D:/Agra/Data-Engineer/GCP-DataEngineerLearningPath/Quest-DataProcessing/Quest-1/output.csv', index=False)

def run():

    parser = argparse.ArgumentParser(description='JSON to CSV')
    parser.add_argument('--runner', required=True, help='Specify Apache Beam Runner')

    opts = parser.parse_args()

    options = PipelineOptions()
    options.view_as(StandardOptions).runner = opts.runner

    #Add static input and output strings
    input = 'D:/Agra/Data-Engineer/GCP-DataEngineerLearningPath/event.json'

    p = beam.Pipeline(options=options)

    '''

    Steps:
    1) Read something
    2) Transform something
    3) Write something

    '''

    (p
        | 'ReadJsonFile' >> beam.io.ReadFromText(input)
        | 'ParseJson' >> beam.Map(parse_json)
        | 'TransformToCsv' >> beam.Map(process)
    )

    logging.getLogger().setLevel(logging.INFO)
    logging.info("Building pipeline ...")

    p.run()

if __name__ == '__main__':
  run()
