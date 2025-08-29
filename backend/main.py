# /backend/main.py
from fastapi import FastAPI, Body, Depends, HTTPException
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from typing import List

from database import user_collection, pet_collection, user_helper, pet_helper
from models import UserSchema, UserLoginSchema, PetSchema
from auth import get_password_hash, verify_password, create_access_token, get_current_user

app = FastAPI()

# --- CORS Middleware ---
# This allows the Flutter app to call the backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Allow all origins for simplicity
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# --- Authentication Routes ---
@app.post("/auth/register", tags=["Auth"])
async def register(user: UserSchema = Body(...)):
    # Check if user already exists
    existing_user = await user_collection.find_one({"email": user.email})
    if existing_user:
        raise HTTPException(status_code=400, detail="User with this email already exists")

    # Hash the password and save the new user
    hashed_password = get_password_hash(user.password)
    user_data = {"email": user.email, "password": hashed_password}
    new_user = await user_collection.insert_one(user_data)
    return JSONResponse(status_code=201, content={"message": "User created successfully"})

@app.post("/auth/login", tags=["Auth"])
async def login(user: UserLoginSchema = Body(...)):
    # Find user in the database
    db_user = await user_collection.find_one({"email": user.email})
    if not db_user or not verify_password(user.password, db_user["password"]):
        raise HTTPException(status_code=401, detail="Incorrect email or password")

    # Create and return a JWT token
    access_token = create_access_token(data={"sub": user.email})
    return {"access_token": access_token, "token_type": "bearer"}


# --- Pet Routes ---
@app.post("/pets", tags=["Pets"])
async def add_pet(pet: PetSchema = Body(...), current_user: dict = Depends(get_current_user)):
    pet_data = pet.dict()
    pet_data["owner_email"] = current_user["email"]
    
    new_pet = await pet_collection.insert_one(pet_data)
    created_pet = await pet_collection.find_one({"_id": new_pet.inserted_id})
    return JSONResponse(status_code=201, content=pet_helper(created_pet))

@app.get("/pets", tags=["Pets"])
async def get_pets(current_user: dict = Depends(get_current_user)):
    pets = []
    async for pet in pet_collection.find({"owner_email": current_user["email"]}):
        pets.append(pet_helper(pet))
    return pets


# --- Root Route ---
@app.get("/", tags=["Root"])
async def read_root():
    return {"message": "Welcome to the Pet App API!"}