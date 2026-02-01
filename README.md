# Waster App - Food Donation Platform 🍽️

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack & Key Libraries](#tech-stack--key-libraries)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Project Configuration](#project-configuration)
  - [Building for Production](#building-for-production)
  - [Troubleshooting](#troubleshooting)
- [Architecture Overview](#architecture-overview)
- [Feature Modules](#feature-modules)
  - [Authentication Module](#1--authentication-module)
  - [Home Module](#2--home-module)
  - [Browse Module](#3--browse-module)
  - [Post Module](#4--post-module)
  - [Claim Module](#5--claim-module)
  - [Settings Module](#6--settings-module)
  - [Impact Module](#7--impact-module)
  - [Notifications Module](#8--notifications-module)
- [Project Structure](#project-structure)
- [Future Enhancements](#future-enhancements)

---

## 🌟 Overview

**Waster** is a Flutter-based mobile application that connects food donors with recipients to reduce food waste and fight hunger. The app enables restaurants, bakeries, and organizations to donate surplus food to those in need, while tracking environmental impact and community engagement.

### Key Highlights
- 🎯 **Mission**: Reduce food waste while addressing food insecurity
- 📱 **Platform**: Flutter (iOS & Android)
- 🏗️ **Architecture**: Clean Architecture with BLoC pattern
- 🌍 **Localization**: Multi-language support (English/Arabic)
- 🎨 **Theming**: Dark/Light mode support
- 🔐 **Authentication**: Email/Password + Google Sign-In
- 📊 **Analytics**: Real-time impact tracking

---
## ✨ Features

### 🔐 Authentication & Authorization
- **Email & Password Login** - Secure authentication with JWT tokens
- **User Registration** - Complete signup flow with validation
- **Google Sign-In** - One-tap authentication via Google OAuth
- **Automatic Token Refresh** - Seamless session management with Dio interceptors
- **Secure Token Storage** - Encrypted storage using FlutterSecureStorage
- **Password Validation** - Strong password requirements (8+ chars, uppercase, lowercase, numbers, special characters)
- **Session Persistence** - Stay logged in across app launches

### 🏠 Home & Feed
- **Paginated Feed** - Infinite scroll with pull-to-refresh
- **Category Filtering** - Filter by food type (All, Meat, Vegetables, Fruits, Other)
- **Real-time Updates** - Automatic feed refresh on data changes
- **Bookmark Integration** - Synchronized bookmark status across feeds
- **Skeleton Loading** - Smooth loading states for better UX
- **Empty States** - User-friendly messages when no posts available

### 🔍 Browse & Search
- **Real-time Search** - Debounced search with instant results (500ms delay)
- **Advanced Filtering** - Filter by category, location, and expiry date
- **Expiring Soon Section** - Urgent donations highlighted separately
- **Post Details View** - Comprehensive post information with owner details

### 📝 Post Management (Donors)
- **Create Donations** - Post food items with images, details, and expiry dates
- **Edit Posts** - Modify existing donations with change detection
- **Delete Posts** - Remove donations with confirmation dialog
- **Image Upload** - Camera or gallery selection with automatic compression
- **Form Validation** - Real-time validation with helpful error messages
- **My Posts View** - Manage all your donations in one place
- **Post Status Tracking** - See if posts are Available, Reserved, or Expired

### 🤝 Claim Management (Recipients)
- **Claim Posts** - Request available food donations
- **My Claims View** - Track all claimed items with status
- **Claim Status** - Pending, Approved, Rejected states
- **Cancel Claims** - Cancel pending claims
- **WhatsApp Integration** - Contact donors directly via WhatsApp
- **Claim History** - View past claimed items

### 👤 Profile & Settings
- **View Profile** - See your account information and statistics
- **Edit Profile** - Update name, bio, location, and phone number
- **Change Email** - Update email with verification
- **Change Password** - Secure password update with current password verification
- **Complete Profile Reminder** - Smart reminder for incomplete profiles (shows every 24 hours)
- **Account Deletion** - Permanently delete account with password confirmation

### 📊 Impact Dashboard
- **Total Donations** - See how many items you've donated
- **Meals Served** - Track total kilograms donated
- **Monthly Goals** - Set and track donation targets
- **Progress Tracking** - Visual progress bar
- **Available Posts Count** - Active donations
- **Pending Claims Count** - Claims awaiting approval

### 🔔 Notifications
- **Real-time Notifications** - Get notified about claims and approvals
- **Filter by Status** - View All or Unread notifications
- **Badge Indicators** - Visual indicators for different notification types
- **Delete Notifications** - Remove unwanted notifications
- **Mark as Read** - Track read/unread status

### 🌐 Internationalization
- **Multi-language Support** - English and Arabic
- **RTL Support** - Right-to-left layout for Arabic
- **Dynamic Language Switching** - Change language without app restart
- **Localized Date/Time** - Context-aware date formatting

### 🎨 Theming & UI
- **Dark Mode** - Toggle between light and dark themes
- **Theme Persistence** - Remember theme preference
- **Responsive Design** - Adapts to different screen sizes
- **Custom Animations** - Smooth transitions and loading states
- **Material Design 3** - Modern UI components
- **Custom Color Palette** - Brand-specific colors for light/dark modes

### 📱 User Experience
- **Pull-to-Refresh** - Refresh any list with pull gesture
- **Infinite Scroll** - Load more items automatically
- **Skeleton Loaders** - Beautiful loading placeholders
- **Empty States** - Helpful messages when no data available
- **Error Handling** - User-friendly error messages
- **Toast Notifications** - Quick feedback for actions
- **Confirmation Dialogs** - Prevent accidental actions
- **Form Validation** - Real-time input validation with clear error messages

### 🔒 Security Features
- **JWT Authentication** - Industry-standard token-based auth
- **Secure Storage** - Encrypted local storage for tokens
- **Token Auto-Refresh** - Automatic token renewal before expiry
- **Logout on Token Expiry** - Automatic logout when tokens are invalid
- **Password Strength Validation** - Enforce strong passwords
- **Network Security** - HTTPS API communication

### 🚀 Performance
- **Image Caching** - Cached network images for faster loading
- **Lazy Loading** - Load images and data on demand
- **Pagination** - Efficient data loading in chunks
- **Debouncing** - Optimized search input handling
- **Const Widgets** - Minimize unnecessary rebuilds
- **Image Compression** - Reduce image sizes before upload

### 📦 Offline Capabilities
- **Token Persistence** - Stay logged in offline
- **Theme Preference** - Remember settings offline
- **Language Preference** - Cached language selection
- **Network Detection** - Alert users when offline
- **Cached Images** - View previously loaded images offline

### 🔗 Integrations
- **Google OAuth** - Seamless Google Sign-In
- **WhatsApp** - Direct communication between users
- **Camera** - Take photos for donations
- **Gallery** - Select existing photos
- **Phone Dialer** - Contact users via phone
- **URL Launcher** - Open external links

### 📈 Analytics Ready
- **User Actions Tracking** - Track donations, claims, searches
- **Event Logging** - BLoC observer for debugging
- **Error Tracking** - Centralized error logging
- **Performance Monitoring** - Track app performance metrics

---
## 🛠️ Tech Stack & Key Libraries

### Framework
* **Flutter 3.10+** - Cross-platform mobile development framework

### State Management
* **flutter_bloc ^9.1.1** - Predictable state management using BLoC/Cubit pattern
* **equatable ^2.0.7** - Value equality for Dart objects

### Networking & API
* **dio ^5.9.0** - Powerful HTTP client for API requests with interceptors
* **connectivity_plus ^7.0.0** - Network connectivity checker

### Dependency Injection
* **get_it ^8.2.0** - Service locator for dependency management

### Navigation
* **go_router ^16.2.4** - Declarative, URL-based routing with deep linking support

### Local Storage
* **flutter_secure_storage ^9.2.4** - Secure storage for sensitive data (tokens)
* **shared_preferences ^2.5.3** - Simple key-value persistence

### Functional Programming
* **dartz ^0.10.1** - Functional programming for robust error handling (Either, Option)

### Authentication
* **google_sign_in ^7.2.0** - Google OAuth authentication

### Internationalization (i18n)
* **easy_localization ^3.0.8** - Localization and internationalization support
* **intl ^0.20.2** - Internationalization utilities

### UI Components & Animations
* **flutter_screenutil ^5.9.3** - Responsive UI scaling
* **cached_network_image ^3.4.1** - Optimized network image loading and caching
* **google_fonts ^6.3.2** - Custom fonts from Google Fonts
* **flutter_svg ^2.2.1** - SVG image rendering
* **skeletonizer ^2.1.0+1** - Skeleton loading states
* **lottie ^3.3.1** - JSON-based animations

### Forms & Input
* **intl_phone_field ^3.2.0** - International phone number input with validation
* **image_picker ^1.2.0** - Camera and gallery image selection

### Utilities
* **mime ^2.0.0** - MIME type detection for file uploads
* **url_launcher ^6.3.2** - Launch URLs, phone calls, and external apps

### Development Tools
* **flutter_lints ^5.0.0** - Official Flutter linting rules
* **flutter_native_splash ^2.4.6** - Native splash screen generation

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

Before you begin, ensure you have the following installed:

* **Flutter SDK ≥ 3.10.0** - [Install Flutter](https://docs.flutter.dev/get-started/install)
* **Dart SDK ≥ 3.0.0** - (Included with Flutter)
* **Android Studio** or **VS Code** with Flutter extensions
* **Xcode** (for iOS development on macOS)
* **Git** - [Install Git](https://git-scm.com/downloads)

**Verify Installation:**
```bash
flutter --version
dart --version
```

### Installation

#### 1. Clone the repository
```bash
git clone https://github.com/yourusername/waster-app.git
cd waster-app
```

#### 2. Install dependencies
Run the following command to fetch all required packages:
```bash
flutter pub get
```

#### 3. Generate localization files
```bash
flutter pub run easy_localization:generate -S assets/translations -O lib/core/localization
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations -O lib/core/localization
```

#### 4. Configure Google Sign-In

Create a file `lib/core/secrets/secrets.dart`:
```dart
class Secrets {
  static const String googleServerClientId = 'YOUR_GOOGLE_SERVER_CLIENT_ID';
}
```

**Get your Google Server Client ID:**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable Google Sign-In API
4. Create OAuth 2.0 credentials
5. Copy the Server Client ID

#### 5. Run the application

**Development Mode:**
```bash
flutter run
```

**Production Mode:**
```bash
flutter run --release
```

### Project Configuration

#### API Base URL
The app connects to: `http://waster.runasp.net`

To change the base URL, edit `lib/core/networking/api_end_points.dart`:
```dart
class ApiEndPoints {
  static const String baseUrl = 'YOUR_API_BASE_URL';
  // ...
}
```

#### App Theme
Default theme can be configured in `lib/core/themes/`:
- `app_colors.dart` - Color palette
- `theme_data.dart` - Light/Dark theme settings
- `app_text_style.dart` - Typography

### Building for Production

#### Android (APK)
```bash
flutter build apk --release
```

#### Android (App Bundle)
```bash
flutter build appbundle --release
```

### Troubleshooting

**Issue: Packages not found**
```bash
flutter clean
flutter pub get
```

**Issue: Build errors**
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

---

## 🏛️ Architecture

The project follows **Clean Architecture** principles with clear separation of concerns:
```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (UI, Widgets, BLoC/Cubit, Controllers) │
└──────────────┬──────────────────────────┘
               │ depends on
               ▼
┌─────────────────────────────────────────┐
│           Domain Layer                  │
│  (Entities, Use Cases, Repository       │
│   Interfaces, Business Logic)           │
└──────────────┬──────────────────────────┘
               │ depends on
               ▼
┌─────────────────────────────────────────┐
│            Data Layer                   │
│  (Repository Implementations, Data      │
│   Sources, Models, API Integration)     │
└─────────────────────────────────────────┘
```

### Layer Responsibilities

#### 🎨 Presentation Layer
- **Purpose**: Handle UI rendering and user interactions
- **Components**:
  - **Widgets**: Reusable UI components
  - **BLoC/Cubit**: State management
  - **Controllers**: Form management and UI logic coordination
- **Rules**:
  - ❌ NO business logic in widgets
  - ❌ NO direct data access
  - ✅ Only communicates with Domain layer
  - ✅ Manages UI state and user events

#### 💼 Domain Layer
- **Purpose**: Contains core business logic
- **Components**:
  - **Entities**: Business models (immutable)
  - **Use Cases**: Single-responsibility business operations
  - **Repository Interfaces**: Abstract contracts for data operations
- **Rules**:
  - ❌ NO dependencies on other layers
  - ❌ NO framework-specific code
  - ✅ Pure Dart code only
  - ✅ Independent and testable

#### 💾 Data Layer
- **Purpose**: Handle data persistence and external APIs
- **Components**:
  - **Repository Implementations**: Concrete implementations of domain contracts
  - **Data Sources**: Remote (API) and Local (Database/Cache)
  - **Models**: Data transfer objects with serialization
- **Rules**:
  - ✅ Depends on Domain layer
  - ✅ Implements repository interfaces
  - ✅ Handles data transformation

---

## ✨ Feature Modules

### 1. 🔐 Authentication Module

**Purpose**: User registration, login, and session management

**Key Features**:
- ✅ Email/Password authentication
- ✅ Google Sign-In integration
- ✅ JWT token management
- ✅ Automatic token refresh
- ✅ Secure token storage
- ✅ Session persistence
- ✅ Logout functionality

**Architecture**:
```
lib/features/auth/
├── domain/
│   ├── entity/
│   │   └── auth_entity.dart                 # User session data
│   ├── repo/
│   │   └── auth_repo.dart                   # Auth repository interface
│   └── usecases/
│       ├── log_in_use_case.dart             # Email/Password login
│       ├── register_use_case.dart           # New user registration
│       ├── refresh_token_use_case.dart      # Token refresh
│       ├── revoke_token_use_case.dart       # Logout
│       └── sign_in_with_google.dart         # Google OAuth
├── data/
│   ├── models/
│   │   ├── auth_response_model.dart         # API response DTO
│   │   ├── login_request_model.dart         # Login request DTO
│   │   └── register_request_model.dart      # Registration request DTO
│   ├── datasource/
│   │   ├── auth_remote_date_source.dart     # API integration
│   │   └── auth_local_data_source.dart      # Token storage
│   └── repo/
│       └── auth_repo_impl.dart              # Repository implementation
└── presentation/
    ├── manager/
    │   └── bloc/
    │       ├── auth_bloc.dart               # Authentication state management
    │       ├── auth_event.dart              # Auth events
    │       └── auth_state.dart              # Auth states
    └── views/
        ├── log_in_view.dart                 # Login screen
        ├── sign_up_view.dart                # Registration screen
        └── widgets/
            ├── log_in_form.dart             # Login form
            ├── sign_up_form.dart            # Registration form
            ├── email_text_field.dart        # Email input
            ├── password_text_field.dart     # Password input
            ├── confirm_password_text_field.dart
            ├── name_text_field.dart         # Name input
            ├── location_text_field.dart     # Address input
            ├── google_section.dart          # Google Sign-In button
            ├── terms_and_privacy.dart       # T&C checkbox
            └── other_auth_option_widget.dart # Switch between login/signup
```

**Authentication Flow**:
```
User submits credentials
    ↓
AuthBloc receives event (LoginEvent/RegisterEvent)
    ↓
UseCase validates input
    ↓
Repository executes request
    ↓
RemoteDataSource calls API
    ↓
On success: Save tokens to LocalDataSource
    ↓
AuthBloc emits AuthSuccess state
    ↓
UI navigates to MainView
```

### 2. 🏠 Home Module

**Purpose**: Main dashboard for browsing available food donations

**Key Features**:
- ✅ Feed of available food posts (paginated)
- ✅ Category filtering (All, Meat, Vegetables, Fruits, etc.)
- ✅ Real-time donation statistics
- ✅ Quick post creation
- ✅ Bookmark functionality
- ✅ Pull-to-refresh
- ✅ Infinite scroll
- ✅ Skeleton loading states

**Architecture**:
```
lib/features/home/
├── domain/
│   ├── repo/home_repo.dart                     # Repository interface
│   └── usecases/feed_posts_use_case.dart      # Business logic
├── data/
│   ├── datasource/home_remote_data_source.dart # API integration
│   └── repo/home_repo_impl.dart                # Repository implementation
└── presentation/
    ├── manager/feed_cubit/                     # State management
    │   ├── feed_cubit.dart
    │   └── feed_state.dart
    └── views/
        ├── main_view.dart                       # Main screen with bottom nav
        ├── home_view.dart                       # Home tab content
        └── widgets/
            ├── feed_posts_list_view.dart        # Posts list
            ├── home_categories_tab_bar.dart     # Category tabs
            ├── custom_home_app_bar.dart         # App bar
            ├── custom_post_card.dart            # Post card
            └── custom_order_state_widget.dart   # Status badge
```

### 3. 🔍 Browse Module

**Purpose**: Search and filter available food donations

**Key Features**:
- ✅ Real-time search functionality
- ✅ Category-based filtering
- ✅ "Expiring Soon" section (urgent donations)
- ✅ Location-based filtering
- ✅ Advanced search capabilities
- ✅ Search history
- ✅ Empty state handling

**Architecture**:
```
lib/features/browse/
├── domain/
│   ├── entity/
│   │   └── category_entity.dart                # Category model
│   ├── repo/
│   │   └── browse_repo.dart                    # Repository interface
│   └── usecase/
│       ├── categories_use_case.dart            # Get categories
│       ├── expiring_soon_posts_use_case.dart   # Urgent posts
│       └── search_post_use_case.dart           # Search functionality
├── data/
│   ├── models/
│   │   └── category_model.dart                 # Category DTO
│   ├── datasource/
│   │   └── browse_remote_data_source.dart      # API integration
│   └── repo/
│       └── browse_repo_impl.dart               # Repository implementation
└── presentation/
    ├── manager/
    │   ├── categories_cubit/
    │   │   ├── categories_cubit.dart           # Categories state
    │   │   └── categories_state.dart
    │   ├── expiring_soon_cubit/
    │   │   ├── expiring_soon_cubit.dart        # Urgent posts state
    │   │   └── expiring_soon_state.dart
    │   └── search_cubit/
    │       ├── search_cubit.dart               # Search state
    │       └── search_state.dart
    └── views/
        ├── browse_all_view.dart                # Search screen
        ├── track_all_view.dart                 # Expiring soon screen
        ├── order_details_view.dart             # Post details
        └── widgets/
            ├── expiring_soon_list_view.dart
            ├── search_posts_list_view.dart
            ├── custom_search_field.dart
            └── filter_bottom_sheet.dart
```

### 4. ➕ Post Module

**Purpose**: Create, edit, and manage food donation posts

**Key Features**:
- ✅ Create new donation posts
- ✅ Edit existing posts
- ✅ Delete posts
- ✅ Image upload (camera/gallery)
- ✅ Form validation
- ✅ Category and unit selection
- ✅ Expiry time picker
- ✅ Change detection (edit mode)
- ✅ Image processing (compression, base64)

**Architecture**:
```
lib/features/post/
├── domain/
│   ├── entity/
│   │   └── enums/
│   │       └── post_mode_enum.dart             # Create/Edit mode
│   ├── repo/
│   │   └── post_repo.dart                      # Repository interface
│   └── usecases/
│       ├── add_donation_post_usecase.dart      # Create post
│       ├── edit_donation_post_usecase.dart     # Update post
│       ├── delete_post_usecase.dart            # Delete post
│       ├── get_all_user_posts_usecase.dart     # User's posts
│       ├── add_book_mark_use_case.dart         # Add bookmark
│       ├── delete_book_mark_use_case.dart      # Remove bookmark
│       ├── get_all_book_mark_use_case.dart     # Get bookmarks
│       └── process_image_usecase.dart          # Image compression
├── data/
│   ├── models/
│   │   └── create_post_model.dart              # Post DTO
│   ├── datasource/
│   │   └── post_remote_data_source.dart        # API integration
│   └── repo/
│       └── post_repo_impl.dart                 # Repository implementation
└── presentation/
    ├── manager/
    │   ├── bloc/                                # Post CRUD operations
    │   │   ├── post_bloc.dart
    │   │   ├── post_event.dart
    │   │   └── post_state.dart
    │   ├── get_all_user_posts_cubit/           # User's posts list
    │   │   ├── get_all_user_posts_cubit.dart
    │   │   └── get_all_user_posts_state.dart
    │   └── book_mark_cubit/                     # Bookmark management
    │       ├── book_mark_cubit.dart
    │       └── book_mark_state.dart
    └── views/
        ├── donate_view.dart                     # Create/Edit form
        ├── my_posts_view.dart                   # User's posts list
        ├── book_mark_view.dart                  # Saved posts
        ├── controller/
        │   └── post_controller.dart             # Form logic
        └── widgets/
            ├── donate_form.dart
            ├── image_picker_section.dart
            ├── category_dropdown.dart
            ├── unit_dropdown.dart
            └── expiry_date_picker.dart
```

### 5. 🤝 Claim Module

**Purpose**: Manage food donation claims and approvals

**Key Features**:
- ✅ Claim available posts
- ✅ View claimed posts (as recipient)
- ✅ Approve/reject claims (as donor)
- ✅ Cancel claims
- ✅ Contact donor/recipient via WhatsApp
- ✅ Status tracking (Pending, Approved, Rejected)
- ✅ Claim history

**Architecture**:
```
lib/features/claim/
├── domain/
│   ├── entity/
│   │   ├── claim_entity.dart                   # Main claim model
│   │   ├── claim_post_entity.dart              # Post info in claim
│   │   ├── claim_user_entity.dart              # User info in claim
│   │   └── claim_response_entity.dart          # Claim action response
│   ├── repo/
│   │   └── claim_repo.dart                     # Repository interface
│   └── usecase/
│       ├── claim_post_use_case.dart            # Create claim
│       ├── get_user_claims_use_case.dart       # Get user's claims
│       ├── get_post_claims_use_case.dart       # Get post's claims
│       ├── approve_claim_use_case.dart         # Approve claim
│       ├── reject_claim_use_case.dart          # Reject claim
│       └── cancel_claim_use_case.dart          # Cancel claim
├── data/
│   ├── models/
│   │   ├── claim_model.dart                    # Claim DTO
│   │   ├── claim_post_model.dart               # Post DTO
│   │   └── claim_user_model.dart               # User DTO
│   ├── datasource/
│   │   └── claim_remote_data_source.dart       # API integration
│   └── repo/
│       └── claim_repo_impl.dart                # Repository implementation
└── presentation/
    ├── manager/
    │   └── cubit/
    │       ├── claim_cubit.dart                # Claim state management
    │       └── claim_state.dart
    └── views/
        ├── claim_view.dart                     # Claims list screen
        └── widgets/
            ├── claimed_post_container.dart     # Claimed post card
            ├── claims_post_bottom_sheet.dart   # Post claims sheet
            └── custom_claims_post_widget.dart  # Individual claim item
```

### 6. 👤 Settings Module

**Purpose**: User profile and account management

**Key Features**:
- ✅ View/edit profile information
- ✅ Change email/password
- ✅ Update phone number, location, bio
- ✅ Notification preferences
- ✅ App preferences (theme, language)
- ✅ Account deletion
- ✅ Complete profile reminder dialog
- ✅ Field-level change detection

**Architecture**:
```
lib/features/settings/
├── domain/
│   ├── entity/
│   │   └── user_entity.dart                    # User profile model
│   ├── repo/
│   │   └── settings_repo.dart                  # Repository interface
│   └── usecases/
│       ├── get_user_details_use_case.dart      # Get profile
│       ├── save_profile_changes_use_case.dart  # Batch update
│       ├── change_email_use_case.dart          # Update email
│       ├── change_password_use_case.dart       # Update password
│       └── delete_account_use_case.dart        # Delete account
├── data/
│   ├── models/
│   │   └── user_model.dart                     # User DTO
│   ├── datasource/
│   │   └── settings_remote_data_source.dart    # API integration
│   └── repo/
│       └── setting_repo_impl.dart              # Repository implementation
└── presentation/
    ├── manager/
    │   └── bloc/
    │       ├── settings_bloc.dart              # Settings state management
    │       ├── settings_event.dart
    │       └── settings_state.dart
    └── views/
        ├── settings_view.dart                  # Settings menu
        ├── profile_view.dart                   # Profile display
        ├── profile_editing_view.dart           # Profile editing
        ├── controller/
        │   └── profile_editing_form_controller.dart
        └── widgets/
            ├── settings_list_tile.dart
            ├── theme_toggle_tile.dart
            ├── language_selector.dart
            ├── complete_profile_dialog.dart
            └── delete_account_dialog.dart
```

### 7. 📊 Impact Module

**Purpose**: Display user's environmental and social impact

**Key Features**:
- ✅ Total donations count
- ✅ Meals served statistics
- ✅ Available/claimed posts metrics
- ✅ Monthly goals tracking
- ✅ Visual progress indicators

**Architecture**:
```
lib/features/impact/
├── domain/
│   ├── entity/
│   │   └── impact_entity.dart                  # Impact metrics model
│   ├── repo/
│   │   └── impact_repo.dart                    # Repository interface
│   └── usecase/
│       └── get_impact_use_case.dart            # Fetch impact data
├── data/
│   ├── models/
│   │   └── impact_model.dart                   # Impact DTO
│   ├── datasource/
│   │   └── impact_remote_data_source.dart      # API integration
│   └── repo/
│       └── impact_repo_impl.dart               # Repository implementation
└── presentation/
    ├── manager/
    │   └── cubit/
    │       ├── impact_cubit.dart               # Impact state management
    │       └── impact_state.dart
    └── views/
        ├── impact_view.dart                    # Impact dashboard
        └── widgets/
            ├── custom_claim_info_cards.dart    # Metrics cards
            ├── main_impact_grid_view.dart      # Impact grid
            ├── monthly_goals_section.dart      # Goals progress
            └── impact_chart.dart               # Visual charts

```
### 8. 🔔 Notifications Module

**Purpose**: Display user notifications

**Key Features**:
- ✅ View all notifications
- ✅ Filter by read/unread
- ✅ Mark as read
- ✅ Delete notifications
- ✅ Different notification types
- ✅ Badge indicators

**Architecture**:
```
lib/features/notifications/
└── presentation/
    └── views/
        ├── notifications_view.dart             # Notifications screen
        └── widgets/
            ├── custom_notifications_app_bar.dart
            ├── notification_tab_bar_section.dart
            ├── notifications_list_view.dart
            ├── notification_container.dart
            └── tab_item.dart
```


## 🔮 Future Enhancements

### Planned Features

1. **Real-time Notifications**
   - Firebase Cloud Messaging
   - Push notifications for claims
   - In-app notifications

2. **Advanced Search**
   - Distance-based filtering
   - Dietary preferences
   - Allergen filtering

3. **Gamification**
   - Badges and achievements
   - Leaderboards
   - Donation streaks

---
