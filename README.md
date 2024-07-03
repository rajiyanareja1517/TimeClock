
# TimeClock Project

A TimeClock project created in flutter. TimeClock supports both ios and android, clone the appropriate branches mentioned below:

* For Mobile: https://github.com/rajiyanareja1517/TimeClock 

Download or clone this repo by using the link below:

```
https://github.com/rajiyanareja1517/TimeClock.git
```

## TimeClock Features:

#### Stopwatch
  * Start, stop, and reset functionalities.
  * Record lap times to track multiple time intervals.

#### Analog Clock
 * Display the current time in a traditional clock format.
 * Visual representation of time with hour, minute, and second hands.
 
#### Strap Watch
* Emulate the appearance of a wristwatch with customizable straps.
* Display the current time in a analog format.
* watch appearance with different strap colors.

  
#### Digital Watch
 * Present the current time numerically with hours, minutes, and seconds.
   
#### Alarm Page
 * Set and manage alarms for timely reminders.
 * Easily view and manage existing alarms from the Alarm Page.


### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- screens/
|- utils/
|- main.dart
```

### screens

This directory screens all the screen of the application together in one place. A separate file is created for each type as shown in example below:

```
screens/
|- homePage.dart
|- digitalClock.dart
|- analogueClock.dart
|- StrapWatch.dart
|- alrampage.dart
|- stopWatch.dart
```

### utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows:

```

|- utils/
    |- alarm.dart/
    
```


### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:time_clock/screens/Strap_clock.dart';
import 'package:time_clock/screens/alarm_page.dart';
import 'package:time_clock/screens/analog_clock.dart';
import 'package:time_clock/screens/digital_clock.dart';
import 'package:time_clock/screens/homePage.dart';
import 'package:time_clock/screens/stopWatch.dart';


void main() {
  runApp(
    NeumorphicApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>homePage(),
        'digital_Clock' : (context) => digitalClock(),
        'analog_Clock' : (context) => analogueClock(),
        'strap_Clock' : (context) => StrapWatch(),
        'alram_Clock' : (context) => alrampage(),
        'stop_Watch' : (context) => stopWatch(),
      },
    ),
  );
}
```



https://github.com/rajiyanareja1517/TimeClock/assets/165259303/21c45455-26ab-4b6b-99fa-b2d21785bc77



![Screenshot_20240703_222330](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/6642e7b8-9229-4744-ac2a-7c1817b217eb)
![Screenshot_20240703_222417](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/c73501d7-e8a0-47b6-a412-e7eafe4e3302)
![Screenshot_20240703_222434](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/a9007936-704d-4f8f-ad9b-c14292788605)
![Screenshot_20240703_222457](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/a247f04b-3c77-4b76-bd42-7fe4a8c3008b)
![Screenshot_20240703_222618-2](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/4cbcbace-bd10-4fb0-9cc9-ec72aedebbfc)
![Screenshot_20240703_222457-2](https://github.com/rajiyanareja1517/TimeClock/assets/165259303/3e93827f-ca80-4597-bc9a-64ab69daef2b)



## Conclusion

Again to note, this is example can appear as my code for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
