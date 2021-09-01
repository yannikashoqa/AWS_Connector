import requests
import json

with open("DS-Config.json", "r") as f:
    Config = json.load(f)
Manager = Config["MANAGER"]
Port = Config["PORT"]
APIKEY = Config["APIKEY"]

with open("AWS-Config.json", "r") as a:
    Account = json.load(a)
displayName = Account["displayName"]
useInstanceRole = Account["useInstanceRole"]
crossAccountRoleArn = Account["crossAccountRoleArn"]

AWSConnectors_apipath = '/api/awsconnectors'
DSM_URI = ''.join(['https://',Manager, ':', Port])
AWSConnectors_Uri = ''.join([DSM_URI,AWSConnectors_apipath])

Headers = {
    'Content-Type': "application/json",
    'api-version': "v1",
    'api-secret-key': APIKEY
    }    

new_AWSConnector = {
    "displayName": displayName,
    "crossAccountRoleArn": crossAccountRoleArn
    }

new_AWSConnector_Payload = json.dumps(new_AWSConnector)

response = requests.request("POST", AWSConnectors_Uri, data=new_AWSConnector_Payload, headers=Headers)
print(response.text)

