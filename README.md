# bluestacks_assignment

GameTv app 

# Screens
  - Login Screen
  - Dashboard

# Highlights 

1. Tournament List has
  - Refresh Indicator
  - Pagination (Infinite Scroll)
  - List Item use Flutter's animation library (https://pub.dev/packages/animations) to implement Container closing and opening effect
  - The list is governed by a list bloc
  
2. The dashboard uses slivers and sliver persistent header to show user info and tournament list
3. Overall app is controlled by a Wrapper Bloc to
  - authenticate user
  - switch between authenticate and dashboard screen
  - handle localization event
  - handle sign out event

# references

Hive - for local DB and shared predferences 
  - https://pub.dev/packages/hive_flutter
  - https://pub.dev/packages/hive
  
GetIt - Service locator and dependency injection
  - https://pub.dev/packages/get_it
  
Flutter Bloc - For State Management
  - https://pub.dev/packages/flutter_bloc

 
# Architecture
 The app is developed on BLoC Architecuture depicted as follows 
<p align="center">
  <img src="https://github.com/DN-1596/bluestacks_assignment/blob/main/assets/architecture.jpg" width="350" alt="accessibility text">
</p>

































