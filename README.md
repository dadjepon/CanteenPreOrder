
# canteenpreorder
 _CanteenPreorder: Streamlining Food Ordering at Canteens_

## Project Overview

Our goal is to transform the meal ordering experience in Ashesi campus canteens. 
CanteenPreorder is a software solution that allows students and faculty to preorder meals, 
lowering wait times and increasing convenience. CanteenPreorder seeks to create a seamless and 
efficient meal ordering procedure for students and faculty by including features like push alerts
when food is ready, menu changes, and support for mobile money (MoMo) billing.

### TODO (Key, high level functionalities to be implemented)

1. Establish a preordering system to expedite the meal ordering procedure at Ashesi campus 
canteens.
2. Ensure that clients have access to the most recent information about available selections by 
providing real-time changes to the menu.
3. Allow invoicing using mobile money (MoMo) for safe and easy payment transactions.
4. Constantly improve CanteenPreorder based on insightful input from stakeholders and 
users.

### CanteenPreorderApp
This is application to help Ashesi students and staff to order food for delivery.


### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.


### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains all constants classes
    │   ├── errors                  - It contains error handling classes                  
    │   ├── network                 - It contains network-related classes
    │   └── utils                   - It contains common files and utilities of the application
    ├── data
    │   ├── apiClient               - It contains API calling methods 
    │   ├── models                  - It contains request/response models 
    │   └── repository              - Network repository
    ├── localization                - It contains localization classes
    ├── presentation                - It contains widgets of the screens with their controllers and the models of the whole application.
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### Libraries and tools used
- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image
