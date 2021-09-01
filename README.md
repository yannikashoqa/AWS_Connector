# AWS Connector Scripts

AUTHOR		: Yanni Kashoqa

TITLE		: Deep Security as a Service / Cloud One Workload Security AWS Connector Scripts

DESCRIPTION	: These Powershell and Python scripts will perform AWS Connector functions like listing existing AWs connectors and adding new connectors.

FEATURES
The ability to perform the following:-
- Utilize the new API Key to perform the tasks
- List existing AWS Connectors
- Create new AWS Connectors


REQUIRMENTS
- PowerShell 6.x and higher
- Python 3.x
- An API key that is created on C1WS/DSaaS console
- Create a DS-Config.json and AWS-Config in the same folder with the following content:
- DS-Config.json:
~~~~JSON
{
    "MANAGER": "app.deepsecurity.trendmicro.com",
    "PORT": "443",
    "APIKEY" : ""
}
~~~~

- AWS-Config.json:
~~~~JSON
{
    "displayName": "",
    "useInstanceRole": false,
    "crossAccountRoleArn": ""
}
~~~~
