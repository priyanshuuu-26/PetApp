Pet App - Full-Stack Flutter & FastAPI
A minimal full-stack application featuring a Flutter mobile front-end and a Python FastAPI back-end for managing user pets.

About The Project
This project is a complete, self-contained feature that demonstrates the integration of a mobile application with a REST API. It includes user authentication, token-based session management, and CRUD (Create, Read) operations for pet data.

Tech Stack:

Mobile: Flutter with GetX for state management and navigation.

Back-end: FastAPI with Python.

Database: MongoDB.

Authentication: JWT (JSON Web Tokens).

Features
User Authentication: Secure user registration and login.

Session Persistence: JWT token is stored on the device for a persistent login session.

Pet Management: Authenticated users can add their pets and view a list of pets they've added.

Clean Architecture: The project is separated into /backend and /mobile directories for clear separation of concerns.

Screenshots
Login Screen

Pet List

Add Pet Form

[Insert your login screen screenshot here]

[Insert your pet list screenshot here]

[Insert your add pet form screenshot here]

Getting Started
To get a local copy up and running, follow these simple steps.

Prerequisites
Flutter SDK installed (Version 3.35.2 or compatible).

Python installed (Version 3.9+).

MongoDB installed and running on your local machine.

How to Run the Project
You will need to run two components in separate terminals: the back-end server and the mobile app.

1. Back-end (FastAPI)
First, get the server running.

Navigate to the back-end directory:

cd backend

Create and activate a Python virtual environment:

# Create the virtual environment
python -m venv venv

# Activate it (Windows)
.\venv\Scripts\activate

# Activate it (macOS/Linux)
source venv/bin/activate

Install the required packages:

pip install -r requirements.txt

Run the server:

uvicorn main:app --host 0.0.0.0 --port 8000 --reload

The API will now be running at http://localhost:8000. You can see the auto-generated documentation at http://localhost:8000/docs.

2. Mobile App (Flutter)
Now, run the mobile application.

Navigate to the mobile directory:

cd mobile

Get the Flutter packages:

flutter pub get

IMPORTANT: Update the API URL:
Open the file /mobile/lib/app/data/providers/api_provider.dart. Find the _baseUrl variable and change the IP address to your computer's local network IP.

// For the Android Emulator, 10.0.2.2 usually works.
// For a physical device, find your PC's IP with `ipconfig` (Windows) or `ifconfig` (macOS).
final String _baseUrl = "[http://10.0.2.2:8000](http://10.0.2.2:8000)";

Run the app:
Make sure an emulator is running or a physical device is connected, then run:

flutter run

Your app should now be running and fully connected to your local back-end. 🚀