# 📊 BMI Calculator (Flutter with BLoC)

A sleek, modern, and fully responsive BMI Calculator built using Flutter and Dart. This project focuses on implementing best practices in state management, clean architecture, and responsive UI design without local state hacks.

---

## ✨ Key Features

* **BLoC State Management:** Business logic is entirely separated from the UI layer using the **Flutter_BLoC** library, ensuring a predictable and testable app flow.
* **Fully Responsive UI:** Layouts, fonts, and paddings adapt dynamically to various screen sizes via `MediaQuery`, making it look great on all devices.
* **Pure Clean Architecture:** Organized directory structure with distinct layers for styling, features, and calculation logic.
* **Safe State Mutations:** Built with immutable states and explicit events to handle user inputs safely.

---

## 🛠️ Tech Stack & Concepts

* **Framework:** Flutter
* **Language:** Dart 🎯 *(Configured for 100% Dart recognition)*
* **State Management:** Flutter BLoC
* **Code Pattern:** Feature-First Structure

---

## 📂 Project Structure

```text
lib/
│
├── core/
│   └── constants/          # Application themes, colors, and global styles
│
└── features/
    └── bmi/
        ├── bloc/           # BmiBloc, BmiEvent, and BmiState implementation
        ├── views/          # FirstPage (Input UI) & SecondPage (Output UI)
        └── math_page.dart  # CalculatorBrain (Pure logical formulas)