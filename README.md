

# Remind Me App

A Flutter-based task management application that categorizes tasks into "Today," "Upcoming," "Overdue," "Flagged," and "Completed." This project uses the latest version of Flutter for seamless cross-platform performance.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Setup](#setup)
3. [Running the Application](#running-the-application)
4. [Platform-Specific Implementations](#platform-specific-implementations)
5. [Challenges Faced](#challenges-faced)

---

## Getting Started

To run the project, ensure you have the following tools installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Latest Stable Version) - 3.27.1
- Android Studio, Xcode, or Visual Studio Code (for IDE and emulator/simulator setup)
- Dart 3.0 or later

### Prerequisites

- Ensure you have `flutter` and `dart` added to your system's PATH.
- Check for dependencies by running:
  ```bash
  flutter doctor
  ```

---

## Setup

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up an emulator or connect a physical device:
   - For Android: Use Android Studio to start an emulator.
   - For iOS: Use Xcode's simulator.

4. Update `pubspec.yaml` if needed, ensuring all dependencies are up-to-date:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_bloc: ^8.1.2
     go_router: ^7.0.1
   ```

---

## Running the Application

Run the app on your device or emulator:

### Debug Mode
```bash
flutter run
```

### Release Mode
```bash
flutter build apk --release
```
- For iOS:
  ```bash
  flutter build ipa
  ```

---

## Platform-Specific Implementations

- **Notification Actions (Mark as Done)**:  
  Implemented **notification actions** using **Kotlin** to allow marking tasks as done directly from the notification panel. This feature improves usability without requiring users to open the app.

- **Date Pickers**:  
  Integrated **native date pickers** using **Kotlin** for a consistent and user-friendly date selection experience.

- **Scheduled Notifications**:  
  Added **scheduled notifications** in Kotlin to remind users about upcoming tasks at specific times. Notifications are triggered even if the app is in the background or terminated, ensuring reliability.

---

## Challenges Faced

### 1. **Native Implementations**  
- **Android (Kotlin)** and **iOS (Swift)** implementations for features like **scheduled notifications**, **date pickers**, and **notification actions (Mark as Done)** required bridging Flutter with platform-specific code using **platform channels**.  
- Handling asynchronous communication between Dart and native code for scheduling reminders and updating task status from notifications was complex and required careful debugging.

---

### 2. **Xcode Issues**  
- Faced dependency resolution issues in **Xcode** while integrating the latest Flutter SDK and required plugins for notifications and date pickers.  
- Resolved issues related to build settings, including Swift version compatibility and minimum deployment target adjustments, to ensure smooth builds and testing.  
- Addressed problems with **Info.plist** permissions for notifications and background processes.

---

### 3. **Clean Architecture Implementation**  
- Structuring the app using **Clean Architecture** introduced challenges in organizing features, domain logic, and data sources effectively.  
- Maintaining separation of concerns while ensuring scalability required a deeper understanding of **dependency injection** and **repository patterns**.

---

### 4. **Bloc State Management**  
- Using **flutter_bloc** to handle complex state transitions, especially with tasks filtered by categories like **Today**, **Upcoming**, and **Overdue**, required careful design of events and states.  
- Dynamically updating the UI based on **BlocBuilder** and **BlocListener** without performance overhead was challenging, especially when dealing with large lists of tasks.

---

### 5. **Hydrated Bloc for Persistence**  
- Implementing **Hydrated Bloc** for offline state persistence added challenges in serializing and deserializing custom objects like `Task`.  
- Ensured compatibility with Flutter’s **serialization standards** and managed state restoration seamlessly across app restarts without data loss.

---


### 6. **Dynamic Task Categorization**  
- Filtering tasks dynamically based on categories like **"Today"**, **"Upcoming"**, **"Overdue"**, and **"Completed"** introduced performance considerations, especially for large datasets.  
- Optimized filtering logic to handle real-time updates efficiently without compromising UI responsiveness.  
- Leveraged pre-defined helper functions to streamline category-based filtering while maintaining code readability and scalability.
