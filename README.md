# Task Management App
![Add a heading (1)](https://github.com/Halawany1/task_management/assets/96886506/95292ae5-261f-44ff-b069-73ad5b8d8784)


Welcome to the Task Management App repository! This Flutter app is designed to provide a seamless task management experience, featuring Firebase for authentication and database services.
## Demo
#### [Video](https://drive.google.com/file/d/1YPPqZBbuCBiSv6C8BoY-8lHHCrtUTKBs/view?usp=drive_link)

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
4. [Project Structure](#project-structure)
5. [Usage](#usage)
6. [Dependencies](#dependencies)

## Overview

The Task Management App is a Flutter-based application that leverages Firebase for authentication and database services, providing a robust and user-friendly task management experience. With state management using Bloc and secure data storage using shared preferences, this app showcases best practices in Flutter development.

## Features

- **Firebase Authentication:**  Implements user authentication functionalities such as Sign In and Sign Up using Firebase Authentication.
- 
- **Task Management:** Allows users to create, update, delete, and manage tasks, stored securely in Firebase Firestore.

- **Professionally Shared Preferences:** Securely stores user data and preferences using shared preferences, ensuring a professional and reliable data storage solution.

- **Reusable Components:** Promotes code reusability by incorporating reusable components for a more modular and maintainable codebase.

- **State Management (Cubit):**  Adopts the cubit pattern for efficient state management, ensuring a scalable and organized application architecture.

## Getting Started

### Prerequisites

- Ensure you have Flutter and Dart installed on your development machine. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Halawany1/task_management.git
1. Navigate to the project directory:
    ```bash
   cd task_management
2. Install dependencies:
    ```bash
   flutter pub get
    
## Project Structure

The project is structured as follows:

- **lib/**: Contains the main source code of the application.
- **lib/core/network/** : Handles locale & remote functionalities.
- **lib/core/helper/** : Contains the bloc observer to tracking stated of the application.
- **lib/core/constants/** : Contains constant shared attributes of the application.
- **lib/core/error/** : Contains validation form error.
- **lib/core/component/** : Includes reusable components used throughout the app.
- **lib/views/** : Contains different screens of the application.
- **lib/models/** :  Contains different models of the application.
- **lib/controller/** : Implements Cubit for state management.

  
## Usage
- To run the app on an emulator or physical device, use the following command:
   ```bash
   flutter run

## Dependencies
The project relies on the following key dependencies:

## Dependencies

The E-Commerce App relies on the following key dependencies, each serving a specific purpose:

- **`cupertino_icons`**: Provides Cupertino style icons for iOS.

- **`google_fonts`**: Enables the use of Google Fonts in the Flutter app.

- **`intl`**: Offers internationalization and localization support.

- **`bloc`**: A predictable state management library for Flutter applications.

- **`flutter_bloc`**: The Flutter-specific implementation of the BLoC pattern for state management.

- **`dio`**: A powerful HTTP client for Dart, utilized for efficient handling of API requests.
  
- **`uuid`**: Generates universally unique identifiers (UUIDs).
  
- **`icon_broken`**:  Provides a set of broken-style icons.
  
- **`firebase_core`**: Integrates Firebase core functionalities into the Flutter app.
  
- **`firebase_auth`**: Implements Firebase Authentication for user management.
  
- **`cloud_firestore`**: Provides a cloud-hosted NoSQL database solution.

- **`firebase_storage`**: Facilitates file storage and retrieval in Firebase.


For a complete list of dependencies, refer to the `pubspec.yaml` file.

# Architecture

The Task Management App follows the Model-View-Controller (MVC) architecture to ensure a clear separation of concerns, making the app scalable and maintainable.

### Model
The Model represents the data and the business logic of the application. It is responsible for managing the data, including retrieving, updating, and saving data.

- **lib/models/**: Contains data models, such as task models and user models, defining the structure of data used in the application.
### View
The View displays the data to the user and sends user commands to the Controller. It represents the UI components of the application.

- **lib/views/**: Contains the UI code, including different screens and widgets that present the data to the user.
- **lib/core/component/**: Includes reusable UI components used across different views.
### Controller
The Controller handles the user input, processes it (by updating the Model if necessary), and returns the output display to the View.

- **lib/controller/**: Contains Cubit classes for state management, handling the business logic and interactions between the Model and the View.
- **lib/core/helper/**: Includes helper classes such as the bloc observer for tracking application state.
- 

## Feedback

If you have any feedback, please reach out to us at mohamedelhalawany120@gmail.com

## 🔗 You can follow me on

[![portfolio](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/halawany1)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohamed-elhalawany-329314220/)

