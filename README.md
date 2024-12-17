
# 🌤 WeatherApp

A clean and scalable iOS application that integrates with the [WeatherAPI](https://www.weatherapi.com/) to allow users to search for locations and view weather data. Built using **Swift**, **SwiftUI**, and following the **Clean Architecture** principles.

---

## 📋 Features

- **Search for Locations**: Type and search for any location to fetch suggestions.
- **Fetch Weather**: View real-time weather data for the selected location.
- **Clean Architecture**: Ensures scalability, testability, and maintainability.
- **Custom UI**: A clean, user-friendly interface built with SwiftUI.

---

## 🛠 Requirements

- **Xcode**: Version 14.0+ (Recommended)
- **iOS**: 15.0+
- **Swift**: 5.0+
- **WeatherAPI Key**: Obtain an API key from [WeatherAPI.com](https://www.weatherapi.com/).

---

## 🚀 Setup Instructions

Follow these steps to set up and run the project on your machine:

### 1. Clone the Repository

Clone the project repository from GitHub (or wherever it's hosted).

```bash
git clone https://github.com/cshireman/WeatherApp.git
cd WeatherApp
```

### 2. Install Dependencies

Ensure you have **Xcode** and Swift tools installed. Open the project in Xcode:

```bash
open WeatherApp.xcodeproj
```

### 3. Obtain WeatherAPI Key

- Go to [WeatherAPI.com](https://www.weatherapi.com/) and sign up for a free account.
- Copy your API key.

### 4. Configure API Key

1. Open `WeatherRepository.swift` in the `Data` layer.
2. Replace `"YOUR_API_KEY"` with your WeatherAPI key:

```swift
private let apiKey = "YOUR_API_KEY"
```

Alternatively, you can securely store the key in a `.plist` or environment variable.

### 5. Run the App

- Select an iOS Simulator or physical device from Xcode.
- Build and run the project:

```bash
⌘ + R
```

---

## 📂 Project Structure

The project follows **Clean Architecture** and is organized as:

```
WeatherApp/
│
├── Domain/             # Business logic and use cases
│   ├── Models/         # Location and Weather models
	├── Responsed/      # Responses to network requests
│   ├── UseCases/       # Use case implementations
│
├── Data/               # Repositories and network layer
│   ├── Network/        # Network manager and endpoints
│   ├── Repository/     # WeatherRepository
│
├── Presentation/       # UI components
│   ├── Views/          # SwiftUI views
│   ├── ViewModels/     # ObservableObjects for UI
│
├── WeatherAppTests/    # Unit tests
│   ├── WeatherAppTests.swift
│
├── Fonts/              # Custom fonts for the app 
│
├── Utils/              		# Utilities
│   ├── DependencyInjection/	# Dependency Injection implementation
│   ├── Extensions/     		# Class Extensions
│
├── Data/               # Repositories and network layer
│   ├── Network/        # Network manager and endpoints
│   ├── Repository/     # WeatherRepository
│
└── Assets/             # App icons and images
```

---

## 📦 Dependencies

The app does not use any external libraries to keep it lightweight. If needed, you can add:

- **Swift Package Manager** for external packages like Alamofire, Moya, etc.

---

## 🧪 Testing

To run unit tests for the repository and use cases:

1. Select the `WeatherAppTests` scheme in Xcode.
2. Run the tests:

```bash
⌘ + U
```

Test coverage includes:
- Mocking network responses for repository tests.
- Verifying data flows from the repository to the use cases.

---

## 📜 License

This project is open-source under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## ✨ Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch:

   ```bash
   git checkout -b feature/new-feature
   ```

3. Commit changes and push:

   ```bash
   git commit -m "Add new feature"
   git push origin feature/new-feature
   ```

4. Create a Pull Request.

---

## 👨‍💻 Author

Developed by **Christopher Shireman**
Reach me at: [chris@shireman.net]  
GitHub: [https://github.com/cshireman](https://github.com/yourusername)

---
