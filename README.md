# 📲 SignalMuse

**SignalMuse** is an NFC-based smart home tag registration app built for iOS. It connects with an Arduino-powered NFC system to register tags that can be used to trigger smart devices — like lights, doors, and more.

This project is a prototype and was built by me as my **first-ever iOS app**, using SwiftUI. While the app doesn’t perform full automation yet, it demonstrates tag registration, UI design, and NFC scan flow simulation.

---

## 🔧 Features

- 📡 Simulated NFC tag scanning (ready for real CoreNFC)
- 📝 Register new tags with custom names and icons
- 🗂 View and manage tags
- 🧼 Clean, aesthetic SwiftUI interface
- ☁️ Future-ready for Firebase or IoT integrations

---

## 🧠 Project Overview

> This project was created to demonstrate an iOS front-end for a smart home system powered by NFC tags. The tags are stored in an **Arduino array**, and my app registers the scanned tags. It was built primarily to learn iOS development, and to pair with a university innovation project.

---

## 💡 Tech Stack

- 🧠 **SwiftUI** (built entirely in code, no storyboards)
- 🛠 **Xcode 15+**
- 📲 **CoreNFC** (simulated for now, real support ready)
- 📶 **Arduino UNO / R4** with HF/NFC reader
- ✨ UI designed using gradients, icons, dark mode support

---

## 📸 Screenshots

| Welcome | Add Tag | View Tags |
|--------|---------|-----------|
| ![welcome](screens/welcome.png) | ![add](screens/add.png) | ![tags](screens/tags.png) |

---

## 🚀 Getting Started

### 1. Requirements
- macOS with Xcode 15 or higher
- iPhone (NFC simulation works, real scanning needs a paid Apple Developer account)

### 2. Installation
- Clone the repo
- Open `SignalMuseG2.xcodeproj`
- Run on a real device or use demo mode

---

## 🎯 Future Plans

- Real NFC scanning with CoreNFC
- Firebase integration to store tags and actions
- Push notifications when tags are triggered
- Smart home API connections (HomeKit, MQTT, etc.)

---

## 👨‍💻 About Me

I’m Ali, a Computer Science student — and this is my first full app using SwiftUI. I made SignalMuse as part of a university innovation project, and to learn how to design, build, and publish iOS apps from scratch.

---

## 📜 License

This project is for educational/demo purposes and is licensed under MIT.

---
