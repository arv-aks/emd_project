# Project Setup

## Setup Instructions

1. **Create a New Flutter Project:**
   ```bash
   flutter create project_name
   cd project_name

## Project Structure
1. **Application:** Contains controllers.
2. **Core:** Contains constants.
3. **Data:** Contains models and repositories.
4. **Domain:** Contains abstract classes for repositories and network required dependencies.
5. **Presentation:** Contains screens (UI).

## Dependencies

### Runtime Dependencies
- **dio:** ^5.4.3+1
  - For network calls.

- **get:** ^4.6.6
  - For state management.

- **flutter_svg:** ^2.0.10+1
  - For SVG image rendering.

- **permission_handler:** ^11.3.1
  - For handling permissions.

- **freezed_annotation:** ^2.4.2
  - For code generation of immutable classes.

- **geolocator:** ^12.0.0
  - For accessing the device's location.

- **geocoding:** ^3.0.0
  - For converting coordinates into addresses.

- **intl:** ^0.19.0
  - For internationalization and localization.

- **firebase_core:** ^3.1.1
  - Core Firebase SDK to initialize Firebase in the app.

- **firebase_auth:** ^5.1.1
  - For Firebase Authentication (email, Google sign-in).

- **gap:** ^3.0.1
  - For adding spacing between widgets.

- **google_maps_flutter:** ^2.2.8
  - For embedding Google Maps in the app.

- **flutter_stripe:** ^10.2.0
  - For Stripe payments integration.

- **google_sign_in:** ^6.2.1
  - For Google sign-in authentication.

- **font_awesome_flutter:** ^10.7.0
  - For using FontAwesome icons.

- **geocoding_platform_interface:** ^3.2.0
  - For platform-specific geocoding implementations.

### Dev Dependencies
- **build_runner:** ^2.4.11
  - For code generation.

- **flutter_gen_runner:** ^5.6.0
  - For generating Flutter resources.

- **freezed:** ^2.5.2
  - For generating immutable classes.

- **json_serializable:** ^6.8.0
  - For generating JSON serialization code.

