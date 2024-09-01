#!/bin/bash

mongoimport --db='catsdb' --collection='cats' --file='/tmp/cats_info.json' --jsonArray --username='admin' --password='admin' --authenticationDatabase=admin
