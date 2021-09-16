#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Create app password on google

import urllib.request
import subprocess
import requests

email = 'marcos.colpani@gmail.com'
password = 'hbeertedhmeaeftk'
internet = 'UP'

# check internet
url = "http://www.google.com"
timeout = 5
try:
    request = requests.get(url, timeout=timeout)
    internet = "UP"
except (requests.ConnectionError, requests.Timeout) as exception:
    internet = "DOWN"

# check gmail
if internet == "UP":
    auth_handler = urllib.request.HTTPBasicAuthHandler()
    auth_handler.add_password(realm='mail.google.com',
                              uri='https://mail.google.com/',
                              user=email,
                              passwd=password)
    opener = urllib.request.build_opener(auth_handler)
#
    urllib.request.install_opener(opener)
#
    gmailurl = 'https://mail.google.com/gmail/feed/atom'
    with urllib.request.urlopen(gmailurl) as page:
        contents = page.read().decode('utf-8')
#
    ifrom = contents.index('<fullcount>') + 11
    ito = contents.index('</fullcount>')
    fullcount = contents[ifrom:ito]
    print('{}'.format(fullcount))
else:
    print("  ")

