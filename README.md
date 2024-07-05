
## Result
### With Gmail Login
https://github.com/arv-aks/emd_project/assets/84610386/5c7bc0e9-effe-4aa8-946e-9b6dcb8d16e3

### With Email and password Login
https://github.com/arv-aks/emd_project/assets/84610386/348f458a-b13f-4913-8c24-14b91f41168c


## Project setup

Create flutter project 

```bash
  flutter create project_name
```
    
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


## Api Keys, Authentication, Payments
**Google Maps API Key:** Get API key from the Google Cloud Platform.

**Firebase Authentication:** Set up Firebase project and enable signIn methods for email and Google.

**Stripe Payment:** Create an account on Stripe, obtain your publishable and secret keys, and follow the Flutter Stripe setup guide.

## For stripe payments setup

Follow the instructions: https://pub.dev/packages/flutter_stripe

## Fetch Nearby Restaurants
Use the GeoApify api: https://myprojects.geoapify.com

Create an account and get your API key.
Test the URL on the playground and use it in your Flutter app to get nearby restaurants based on the provided latitude and longitude.

## Final Notes
1. Cloud functions are not required for this project.
2. Location-related calls are in HomeController. These can be moved to another repository to improve code readability.
3. API keys can be stored in .env files to avoid exposing them in the code.
4. Email and password login and signup are combined. If a new user tries to log in, they will be automatically signed up and treated the same as a login.
