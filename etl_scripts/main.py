# Load libraries
import boto3
import pandas as pd
import os
from datetime import datetime

# Define parameters
now = datetime.now() # current date and time
accessKeyId = os.environ.get("AWS_ACCESS_KEY_ID")
secretAccessKey = os.environ.get("AWS_SECRET_ACCESS_KEY")
regionName = "us-east-1"
bucketName = "hylanddemo"
outputBlobName = f"iris_setosa_{now}.csv"

# Load iris dataset
df = pd.read_csv("iris.csv")

# Take a subset of the records
df = df[df['Species'] == "setosa"]

# Save the subset of the iris dataframe locally in task node
df.to_csv(outputBlobName, index=False)

# Upload the CSV file to S3
s3 = boto3.resource('s3', aws_access_key_id=accessKeyId, aws_secret_access_key=secretAccessKey, region_name=regionName)
bucket = s3.Bucket(bucketName)
with open(outputBlobName, 'rb') as data:
    bucket.put_object(Key=outputBlobName, Body=data)
