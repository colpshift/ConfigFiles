#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Create app password on google

import urllib.request
import subprocess

email = 'marcos.colpani@gmail.com'
password = 'hbeertedhmeaeftk'
#
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
