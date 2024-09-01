from pymongo import MongoClient
from db import all, get, update_age, add_feature, delete, delete_all

username = "admin"
password = "admin"

client = MongoClient('mongodb://%s:%s@localhost:27017' % (username, password))

print(len(all(client)))

print(get(client, "Coco Whiskers"))

update_age(client, "Coco Whiskers", 3)
print(get(client, "Coco Whiskers"))

add_feature(client, "Coco Whiskers", "cute")
print(get(client, "Coco Whiskers"))

delete(client, "Coco Whiskers")
print(get(client, "Coco Whiskers"))

delete_all(client)