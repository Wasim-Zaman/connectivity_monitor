# 🌐 Connectivity Monitor

A Flutter application that demonstrates real-time internet connectivity monitoring using streams. The app automatically detects when the internet connection is lost and restored, providing a seamless user experience with beautiful UI transitions.

## ✨ Features

- **Real-time Connectivity Monitoring**: Automatically detects internet connection status changes
- **Stream-based Architecture**: Uses Dart streams for reactive programming
- **Beautiful UI**: Modern design with gradient backgrounds and smooth animations
- **State Management**: Implemented with GetX for efficient state management
- **Cross-platform**: Runs on Android, iOS, Web, Windows, macOS, and Linux
- **Responsive Design**: Adapts to different screen sizes and orientations

## 🏗️ Architecture

This project follows a clean architecture pattern with separation of concerns:

```text
lib/
├── main.dart                    # App entry point
├── app.dart                     # Main app widget and UI
├── controllers/                 # State management controllers
│   ├── connectivity_controller.dart  # Handles connectivity state
│   ├── counter_controller.dart      # Simple counter for demo
│   └── resource_bindings.dart       # Dependency injection setup
├── models/                      # Data models
│   └── connectivity_status.dart     # Connectivity status types
└── services/                    # Business logic services
    └── connectivity_services.dart   # Connectivity monitoring service
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.9.0)
- Dart SDK
- Android Studio / VS Code
- Device or emulator for testing

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Wasim-Zaman/connectivity_monitor.git
   cd connectivity_monitor
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## 📱 How it Works

### Connectivity States

The app handles three main connectivity states:

1. **Connected**: Shows the main counter interface with full functionality
2. **Disconnected**: Displays a "No Internet Connection" screen
3. **Unknown/Loading**: Shows a loading spinner while checking connectivity

### Stream Implementation

The connectivity monitoring is implemented using Dart streams:

- `ConnectivityService` creates a stream that listens to network changes
- `ConnectivityController` subscribes to this stream and updates the UI state
- The UI reacts automatically to state changes using GetX observables

### Key Components

- **ConnectivityService**: Core service that wraps the `connectivity_plus` plugin
- **ConnectivityController**: Manages the connectivity state using GetX
- **ConnectivityStatus**: Abstract class with concrete implementations for different states
- **MyHomePage**: Main UI widget that renders different screens based on connectivity

## 🛠️ Dependencies

```yaml
dependencies:
  flutter: sdk
  get: ^4.7.2 # State management
  connectivity_plus: ^7.0.0 # Network connectivity monitoring
  cupertino_icons: ^1.0.8 # iOS-style icons
```

## 🌟 State Management Variations

This project has been implemented with multiple state management solutions across different branches:

- **GetX Branch** (current): Uses GetX for reactive state management
- **[Cubit Branch](https://github.com/Wasim-Zaman/connectivity_monitor/tree/cubit)**: Uses BLoC/Cubit pattern
- **[Riverpod Branch](https://github.com/Wasim-Zaman/connectivity_monitor/tree/riverpod)**: Uses Riverpod for state management

## 🎨 UI Highlights

- **Dark Theme**: Modern dark color scheme with cyan accents
- **Gradient Backgrounds**: Beautiful gradient effects throughout the app
- **Smooth Animations**: Seamless transitions between different states
- **Responsive Layout**: Adapts to different screen sizes
- **Material Design**: Follows Google's Material Design principles

## 🧪 Testing

Run the included tests:

```bash
flutter test
```

The project includes widget tests to ensure the counter functionality works correctly.

## 📦 Building

### Android

```bash
flutter build apk --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

### Desktop

```bash
flutter build windows --release  # Windows
flutter build macos --release    # macOS
flutter build linux --release    # Linux
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

### Wasim Zaman

- GitHub: [@Wasim-Zaman](https://github.com/Wasim-Zaman)
- LinkedIn: [Connect with me](https://www.linkedin.com/in/wasim-zaman/)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX team for the reactive state management solution
- connectivity_plus plugin contributors

---

⭐ Star this repository if you found it helpful!
