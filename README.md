# 🐾 Pet App - Full-Stack Flutter & FastAPI

A minimal **full-stack application** featuring a **Flutter mobile front-end** and a **Python FastAPI back-end** for managing user pets.

---

## 📖 About The Project

This project demonstrates how to integrate a modern **mobile application** with a **REST API** back-end.  
It includes user authentication, token-based session management, and CRUD (Create & Read) operations for pet data.  

The codebase follows a **clean architecture**, separating front-end and back-end into their own directories.

---

## 🛠 Tech Stack

- **Mobile:** Flutter with GetX (state management & navigation)  
- **Back-end:** FastAPI (Python)  
- **Database:** MongoDB  
- **Authentication:** JWT (JSON Web Tokens)  

---

## ✨ Features

- 🔐 **User Authentication** – Secure registration & login with JWT  
- 🔄 **Session Persistence** – JWT stored on device for persistent login  
- 🐶 **Pet Management** – Authenticated users can add and view their pets  
- 🏗 **Clean Architecture** – `/backend` and `/mobile` directories for clear separation of concerns  

---

## 🚀 Getting Started

To get a local copy up and running, follow these steps:

### ✅ Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.35.2 or compatible)  
- [Python](https://www.python.org/downloads/) (v3.9+)  
- [MongoDB](https://www.mongodb.com/try/download/community) installed & running locally  

---

## ⚙️ How to Run the Project

Run these commands step by step in **two terminals**:  
one for the **backend** and one for the **frontend**.

```bash
##################################
# 1️⃣ Start the Back-end (FastAPI)
##################################

# Navigate to backend folder
cd backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
.\venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the server
uvicorn main:app --host 0.0.0.0 --port 8000 --reload

# API will be available at:
# http://localhost:8000


##################################
# 2️⃣ Start the Front-end (Flutter)
##################################


# Get Flutter dependencies
flutter pub get

# Run the Flutter app
flutter run
