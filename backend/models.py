# /backend/models.py
from pydantic import BaseModel, Field, EmailStr

class UserSchema(BaseModel):
    email: EmailStr = Field(...)
    password: str = Field(...)

    class Config:
        json_schema_extra = {
            "example": {
                "email": "abdul@gmail.com",
                "password": "weakpassword"
            }
        }

class UserLoginSchema(BaseModel):
    email: EmailStr = Field(...)
    password: str = Field(...)

    class Config:
        json_schema_extra = {
            "example": {
                "email": "abdul@gmail.com",
                "password": "weakpassword"
            }
        }

class PetSchema(BaseModel):
    name: str = Field(...)
    type: str = Field(..., description="e.g., Dog, Cat")
    age: int = Field(..., gt=0)
    notes: str = Field(default="")

    class Config:
        json_schema_extra = {
            "example": {
                "name": "Rex",
                "type": "Dog",
                "age": 5,
                "notes": "Loves to play fetch."
            }
        }