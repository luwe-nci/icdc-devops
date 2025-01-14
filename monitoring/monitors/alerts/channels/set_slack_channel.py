#!/usr/bin/python

import os
import json
import requests

def setalertslack(project, tier, key):
   API_ENDPOINT = 'https://api.newrelic.com/v2/alerts_channels.json'
   DEVOPS_SLACK_URL = os.getenv('SLACK_URL')
   DEVOPS_SLACK_CHANNEL = os.getenv('SLACK_CHANNEL')

   channel_name = '{}-{} Slack Alerts'.format(project.title(), tier.title())
   channel_found = False
   headers = {'Api-Key': key}
   
   try:
     response = requests.get('{}'.format(API_ENDPOINT), headers=headers)
   except requests.exceptions.RequestException as e:
     raise SystemExit(e)

   for x in response.json()['channels']:
     if channel_name in x.get("name", "none"):
       channel_found = True
       channel_id = x.get('id')

   if not channel_found:
     headers = {
         "Api-Key": key,
         "Content-Type": "application/json"
     }
   
     data = {
       "channel": {
          "name": channel_name,
          "type": "Slack",
          "configuration": {
               "url": DEVOPS_SLACK_URL,
               "channel": DEVOPS_SLACK_CHANNEL
          }
       }
     }

     try:
       response = requests.post('{}'.format(API_ENDPOINT), headers=headers, data=json.dumps(data), allow_redirects=False)
     except requests.exceptions.RequestException as e:
       raise SystemExit(e)
     print("Channel {} created".format(channel_name))
     channel_id = response.json()['channels'][0].get('id')
   else:
     print("Channel {} already exists".format(channel_name))
     
   return(channel_id)