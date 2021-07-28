#!/usr/bin/python

import json
import requests

def getsumocollectors(project, tier, auth):
   API_ENDPOINT = 'https://api.fed.sumologic.com/api/v1/collectors'
   
   headers = {'Authorization': '{}'.format(auth)}
   
   response = requests.get('{}'.format(API_ENDPOINT), headers=headers)

   print('Sumo Collectors:')
   print()
   for x in response.json()['collectors']:
     if project.lower() in x.get("name", "none").lower() and tier.lower() in x.get("name", "none").lower():
       print('  ' + x.get("name", "none"))
   print()