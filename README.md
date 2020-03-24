# Product Name
> Recording food waste app for restaurants and coffees


Implement Wasteagram, a mobile app that enables restaurants/coffees employees to document daily food waste in the form of "posts" consisting of a photo, number of leftover items, the current date, and the location of the device when the post is created. The application will also display a list of all previous posts. 

<img src="/mainpage.png" width="260">   <img src="/additem.png" width="260">   <img src="/detailview.png" width="260">


## Installation

OS X & Linux:

```sh
cd myapp
flutter run
```


## Usage example

A few motivating and useful examples of how your product can be used. Spice this up with code blocks and potentially more screenshots.


## Development setup

* [Install Flutter](https://flutter.dev/get-started/)
* [Flutter documentation](https://flutter.dev/docs)
* [Development wiki](https://github.com/flutter/flutter/wiki)
* [Contributing to Flutter](https://github.com/flutter/flutter/blob/master/CONTRIBUTING.md)

## Release History

* 0.0.4
    * FIX: Responsive Design
    * ADD: Google Analytics
* 0.0.3
    * ADD: Internationalization
* 0.0.2
    * ADD: Accessibility
* 0.0.1
    * Work in progress


## Functionalities
* ✅Project includes well-named model classes with member variables, constructor and member functions.
* ✅Model is instantiated in the scope of the appropriate widgets.
* ✅Model is mostly a "pure Dart" class and not dependent on widgets.
* ✅Displays a circular progress indicator when there is no data. (Video not capturing the circular indicator but its there)
* ✅Displays a list of food waste posts, presenting the date and number of items in each entry.
* ✅App bar displays total number of wasted items.
* ✅Application displays the details of a food waste post when tapped on in the list.
* ✅Navigating "back" from the detail screen displays the list screen.
* ✅Details include photo, date, number of items, and latitude/longitude.
* ✅Tapping a FAB either the camera, to take a photo, or the image gallery, to select a photo.
* ✅Application displays the New Post screen after selecting a photo.
* ✅New Post screen displays the selected photo, a text field for entering number of items, and a button for uploading the post.
* ✅New Post screen displays a numeric keypad when the text field has focus.
* ✅Main upload button triggers validation, displaying an error message when the Number of Items field is blank.
* ✅Tapping the button causes date, number of items, image URL, and location information to be sent to Firestore, and the List Screen to appear.
* ✅Tapping the back button in the app bar displays the List Screen.
* ✅Application stores photos in Cloud Storage, and generates a unique name for each photo stored.
* ✅Application retrieves the URL of the stored photo, for creating a food waste post.
* ✅Viewing the Detail Screen retrieves the image from Cloud Firestore.
* ✅Application stores food waste post as a Firestore document with a date, image url, item count and latitude/longitude.
* ✅Application requests permission for location services, obtains the latitude and longitude of the device or simulated device, and includes the data in the saved food waste post.
* ✅Application wraps interactive widgets, such as buttons, fields and tappable ListTiles in a Semantics widget, and includes meaningful labels and other appropriate properties.
* ✅Project test suite passes, and includes both unit tests and integration tests.
* ✅Unit tests test the model, and integration tests verify any one particular part of the UX flow.
* ✅List Screen uses a StreamBuilder to retrieve an update the list of food waste posts stored in Firestore.
* ✅The ListView updates the displayed list of food waste posts when new posts are stored in the database.


## Meta

Onur Sasmaz – [@onursasmaz](https://www.linkedin.com/in/onursasmaz/) – sasmazonur@oregonstate.edu
