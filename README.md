# GeckoCart

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation Guide](#installation-guide)
- [Dependencies](#dependencies)
- [Project Structure](#project-structure)
- [Custom Components](#custom-components)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Introduction
GeckoCart is a mobile e-commerce application built with React Native. The app provides a seamless and intuitive shopping experience, featuring a user-friendly interface, data persistence with AsyncStorage, and smooth navigation using React Navigation.

## Features
- User authentication and session management
- Product listing and detailed views
- Shopping cart functionality
- Secure checkout process
- Real-time data fetching with Axios
- Interactive charts for analytics
- Optimized for both Android and iOS

## Installation Guide

### Prerequisites
Ensure you have the following installed:
- Node.js (>=18)
- npm or yarn
- React Native CLI
- Android Studio / Xcode for emulation

### Setup Instructions
1. Clone the repository:
   ```sh
   git clone https://gitlab.com/ExistCode/react-native-engineer-shopping-cart.git
   cd react-native-engineer-shopping-cart
   ```
2. Install frontend dependencies:
   ```sh
   npm install  
   # or
   yarn install
   ```
3. Install backend dependencies:
   ```sh
   bundle install
   ```
4. Start the Metro bundler:
   ```sh
   npm start --reset-cache
   ```
5. Start the Rails server:
   ```sh
   rails s -b 0.0.0.0
   ```
6. Run the application:
   - For Android:
     ```sh
     npm run android
     ```
   - For iOS:
     ```sh
     npm run ios
     ```

## Dependencies 
Below is a list of key dependencies used in this project:

### Frontend Dependencies
#### Core Libraries
- `react`: 18.3.1
- `react-native`: 0.76.6
- `react-native-screens`: ^4.5.0

#### Navigation
- `react-navigation`: ^5.0.0
- `@react-navigation/native`: ^7.0.14
- `@react-navigation/native-stack`: ^7.2.0

#### UI and Styling
- `@fortawesome/react-native-fontawesome`: ^0.3.2
- `react-native-chart-kit`: ^6.12.0
- `react-native-safe-area-context`: ^5.1.0
-  `@fortawesome/free-regular-svg-icons`: ^6.7.2
- `@fortawesome/free-solid-svg-icons`: ^6.7.2
- `react-native-svg`: ^15.11.1

#### Data Management & Utilities
- `axios`: ^1.7.9
- `lodash`: ^4.17.21
- `moment`: ^2.30.1

#### State Management
- `@react-native-async-storage/async-storage`: ^2.1.0

#### Development Tools
- `eslint`: ^8.19.0
- `prettier`: 2.8.8
- `jest`: ^29.6.3
- `babel-jest`: ^29.6.3
- `typescript`: 5.0.4

### Backend Dependencies
- `rails`: ~> 8.0.1
- `pg`: ~> 1.1
- `puma`: >= 5.0
- `bcrypt`
- `jwt`
- `rack-cors`
- `jbuilder`
- `solid_cache`
- `solid_queue`
- `solid_cable`
- `bootsnap`, require: false
- `kamal`, require: false
- `thruster`, require: false

#### Development & Testing Tools
- `eslint`: ^8.19.0
- `prettier`: 2.8.8
- `jest`: ^29.6.3
- `babel-jest`: ^29.6.3
- `typescript`: 5.0.4
- `debug`
- `brakeman`, require: false
- `rubocop-rails-omakase`, require: false

## Project Structure
```
GeckoCart/
│── backend/               # Rails API backend
│   ├── app/
│   ├── config/
│   ├── db/
│   ├── Gemfile            # Backend dependencies
│── frontend/              # React Native frontend
│   ├── src/
│   │   ├── components/    # Reusable UI components
│   │   ├── screens/       # App screens
│   │   ├── navigation/    # Navigation setup
│   │   ├── services/      # API and utility functions
│   │   ├── assets/        # Images and static files
│   │   ├── styles/        # Global styling files
│   ├── App.tsx            # Entry point of the app
│   ├── package.json       # Frontend dependencies and scripts
│── diagrams/              # Project-related diagrams
│── README.md              # Documentation
│── INSTRUCTIONS.md        # Additional setup instructions
```

## Custom Components
This project reuses and extends some custom components for improved maintainability and modularity:
- **Button**: A customizable button component with predefined styles
- **Card**: A flexible card component for product listings
- **Header**: A reusable top navigation header with back functionality

## Color Scheme
![Color Scheme](image.png)
referred to: [Brand Guidelines](https://brand.coingecko.com/visual-identity/color/secondary-colors)

## License
This project is licensed under CoinGecko assesment.
