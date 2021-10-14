# Google Maps Integration


## What you'll build 

You'll build a mobile app featuring a Google Map using the Flutter SDK. Your app will:

:heavy_check_mark: Display a Google Map

:heavy_check_mark: Retrieve map data from a web service

:heavy_check_mark: Display this data as markers on the Map

## Google Maps 
* 99% coverage of the world: Build with reliable, comprehensive data for over 200 countries and territories.

* 25 million updates daily: Count on accurate, real-time location information.

* 1 billion monthly active users: Scale confidently, backed by Google Maps' infrastructure.

## Getting Started 

**STEP 1 :**
---
**1. Adding Google Maps Flutter plugin as a dependency**

Adding additional capability to a Flutter app is easy using Pub packages. In this codelab you introduce the Google Maps Flutter plugin by adding a single line to the ```pubspec.yaml``` file.

* Add ```google_maps_flutter: ^1.0.3``` in dependencies: 

```pubspec.yaml```

```
name: google_maps_in_flutter
description: A new Flutter project.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev
version: 1.0.0+1

environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  # Add the following line
  google_maps_flutter: ^1.0.3

flutter:
  uses-material-design: true
```
---
**STEP 2 :**
---
**2. Adding an API key for an Android app**

To add an API key to the Android app, edit the ```AndroidManifest.xml``` file in ```android/app/src/main```. Add a single meta-data entry containing the API key created in the previous step.

```AndroidManifest.xml```

```
        <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR-KEY-HERE"/>

```
---
**STEP 3 :**
---
**3. Run the App**

Run the Flutter app in either iOS or Android to see a single map view, centered on Portland. Feel free to modify the map center to represent your hometown, or somewhere that is important to you.

```$ flutter run```

<p align="center">
<img src="https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/img/e9d9d7f8c362b546.png" alt="drawing" height="700"/>
</p>

---
**STEP 4 :**
---
**4. Congratulations !**

You have integrate google maps to your Flutter App. There are other resources that can help you take this further:


* [Build Mobile Apps With Flutter and Google Maps (a talk given at Cloud Next ‘19)](https://www.youtube.com/watch?v=RpQLFAFqMlw)
* Hadrien Lejard's [```google_maps_webservice```](https://pub.dev/packages/google_maps_webservice) package which makes the Google Maps Web Services, like Directions API, Distance Matrix API, and Places API really easy to use.
* If you want to look at different options for using an API via JSON REST, see [Andrew Brogdon's Medium post](https://medium.com/flutter/some-options-for-deserializing-json-with-flutter-7481325a4450) for a range of options for working with JSON REST APIs.

---
