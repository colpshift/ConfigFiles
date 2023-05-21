#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Surf to https://openweathermap.org/city
# Fill in your CITY
# e.g. Antwerp Belgium
# Check url
# https://openweathermap.org/city/2803138
# you will the city code at the end
# create an account on this website
# create an api key (free)
# LANG included thanks to krive001 on discord


import requests

CITY = "3465729"
API_KEY = "bc3aaad3c4417515925c3c0f810dbdc3"
UNITS = "Metric"
UNIT_KEY = "C"
LANG = "en"
INTERNET = "UP"

# check internet
url = "http://www.google.com"
timeout = 5
try:
    request = requests.get(url, timeout=timeout)
    internet = "UP"
    except (requests.ConnectionError, requests.Timeout) as exception:
    internet = "DOWN"

# check weather
if internet == "UP":
    REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG,  API_KEY, UNITS))
    try:
        # HTTP CODE = OK
        if REQ.status_code == 200:
            CURRENT = REQ.json()["weather"][0]["description"].capitalize()
            TEMP = int(float(REQ.json()["main"]["temp"]))
            # print("{}, {} °{}".format(CURRENT, TEMP, UNIT_KEY))
            print("{}°{}".format(TEMP, UNIT_KEY))
        else:
            print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
    except (ValueError, IOError):
        print("Error: Unable print the data")
else:
    print("  ")
    
