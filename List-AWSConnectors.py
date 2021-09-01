import requests
import json

with open("DS-Config.json", "r") as f:
    Config = json.load(f)
Manager = Config["MANAGER"]
Port = Config["PORT"]
APIKEY = Config["APIKEY"]

AWSConnectors_apipath = '/api/awsconnectors'
DSM_URI = ''.join(['https://',Manager, ':', Port])
AWSConnectors_Uri = ''.join([DSM_URI,AWSConnectors_apipath])

Headers = {
    'Content-Type': "application/json",
    'api-version': "v1",
    'api-secret-key': APIKEY
    }    

response = requests.request("GET", AWSConnectors_Uri, headers=Headers)
print(response.text)