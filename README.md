# ☕ AI Coffee Classifier (Flutter + Flask + Docker + TFLite)

This is a Flutter app that uses a Machine Learning model integrated with a Flask API to classify coffee bean images into five distinct categories. The classification is performed based on three consecutive images, using a client-server architecture via REST API.

---

## 🧠 Features

- 📸 Automatic capture of 3 photos using phone camera
- 🤖 Classification via ConvMixer model using Flask API
- ✅ Final result by majority voting
- 🔗 Communication with server via local network (Docker)
- 🔒 Local storage of results (with future SQL option)
- 🎨 Intuitive and responsive interface

---

## 🚀 How to use

### 📱 You can: Install the app on your phone

1. Access the Releases section of this GitHub repository
2. Download the app-release.apk file
3. Install on your Android device
4. Allow camera access when opening the app for the first time
5. Make sure you're connected to the same network as the Flask server

---

## 📱 Technologies Used

- Flutter (Dart)
- TensorFlow Lite (ConvMixer model)
- Flask (Python)
- Docker
- Flutter plugins:
  - camera
  - image_picker
  - path_provider
  - permission_handler

