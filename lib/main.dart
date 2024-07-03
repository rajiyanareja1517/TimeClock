
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