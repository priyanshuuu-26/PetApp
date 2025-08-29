# /backend/database.py
import motor.motor_asyncio
from bson.objectid import ObjectId

MONGO_DETAILS = "mongodb://localhost:27017" # Connection string for local MongoDB

client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_DETAILS)

database = client.pets_app # Name of the database

# Collections
user_collection = database.get_collection("users")
pet_collection = database.get_collection("pets")

# Helpers to parse MongoDB documents
def user_helper(user) -> dict:
    return {
        "id": str(user["_id"]),
        "email": user["email"],
    }

def pet_helper(pet) -> dict:
    return {
        "id": str(pet["_id"]),
        "owner_email": pet["owner_email"],
        "name": pet["name"],
        "type": pet["type"],
        "age": pet["age"],
        "notes": pet["notes"],
    }