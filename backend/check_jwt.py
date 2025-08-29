# /backend/check_jwt.py
try:
    import jwt
    print("\nSUCCESS: The 'jwt' module was imported correctly!")
    print(f"Module location: {jwt.__file__}")
except ImportError as e:
    print(f"\nERROR: Failed to import 'jwt'. The error is: {e}")
except Exception as e:
    print(f"\nAn unexpected error occurred: {e}")

import sys
print(f"\nPython executable being used: {sys.executable}")