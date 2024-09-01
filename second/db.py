from pymongo import MongoClient


def all(client: MongoClient):
    """Return all cats from the database"""
    return list(client.catsdb.cats.find())


def get(client: MongoClient, name: str):
    """
    Return a cat by name

    If the cat does not exist, return None

    Parameters:
    - client: The MongoClient instance
    - name: The name of the cat
    """
    return client.catsdb.cats.find_one({"name": name})


def update_age(client: MongoClient, name: str, age: int):
    """
    Update the age of a cat by name
    
    Parameters:
    - client: The MongoClient instance
    - name: The name of the cat
    - age: The new age of the cat
    """
    if not client.catsdb.cats.find_one({"name": name}):
        raise ValueError("Cat does not exist")

    client.catsdb.cats.update_one({"name": name}, {"$set": {"age": age}})

def add_feature(client: MongoClient, name: str, feature: str):
    """
    Add a feature to a cat by name
    
    Parameters:
    - client: The MongoClient instance
    - name: The name of the cat
    - feature: The feature to add
    """
    cat = client.catsdb.cats.find_one({"name": name})
    if not cat:
        raise ValueError("Cat does not exist")
    
    if feature in cat["features"]:
        raise ValueError("Feature already exists")

    client.catsdb.cats.update_one({"name": name}, {"$push": {"features": feature}})


def delete(client: MongoClient, name: str):
    """
    Delete a cat by name
    
    Parameters:
    - client: The MongoClient instance
    - name: The name of the cat
    """
    client.catsdb.cats.delete_one({"name": name})


def delete_all(client: MongoClient):
    """Delete all cats
    WARNING: This will delete all cats from the database"""
    client.catsdb.cats.delete_many({})
