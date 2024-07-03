import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
class stopWatch extends StatefulWidget {
  const stopWatch({super.key});

  @override
  State<stopWatch> createState() => _stopWatchState();
}

class _stopWatchState extends State<stopWatch> {
  int seconds=0;
  int minutes=0;
  int hours=0;
  String digitSeconds = "00";
  String digitminutes = "00";
  String digithours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop(){
    timer!.cancel();
    setState(() {
      started=false;
    });
  }
  void reset(){
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitminutes = "00";
      digithours = "00";

      started = false;
      laps.clear();
    });
  }

  void addLaps(){
    if(started)
      {
        String lap = "$digithours:$digitminutes:$digitSeconds";
        setState(() {
          laps.add(lap);
        });
      }
  }
  void start(){
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = seconds+1;
      int localMinutes = minutes;
      int localHours = hours;

      if(localSeconds>59)
        {
          if(localMinutes>59)
            {
              localHours++;
              localMinutes=0;
            }
          else{
            localMinutes++;
            localSeconds=0;
          }
        }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds>=10)?"$seconds":"0$seconds";
        digitminutes = (minutes>=10)?"$minutes":"0$minutes";
        digithours = (hours>=10)?"$hours":"0$hours";
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(
          "Stop Watch",
          style: NeumorphicStyle(
            color: Colors.black,
          ),
          textStyle: NeumorphicTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 5,
                    intensity: 0.8,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  child: Container(
                    height: 290,
                    width: 290,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicText(
                          "$digithours : $digitminutes : $digitSeconds",
                          style: NeumorphicStyle(
                            color: Colors.black,
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: 3,
                    intensity: 0.8,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    width: 370,
                    height: 270,
                    child: ListView.builder(
                      itemCount: laps.length,
                        itemBuilder: (context, index){
                          List reversedLaps = laps.reversed.toList();
                        return Padding(
                            padding: EdgeInsets.only(left: 22,right: 22,top: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NeumorphicText(
                                "Lap ${reversedLaps.length - index}",
                                style: NeumorphicStyle(
                                  color: Colors.black,
                                ),
                                textStyle: NeumorphicTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              NeumorphicText(
                                "${reversedLaps[index]}",
                                style: NeumorphicStyle(
                                  color: Colors.black,
                                ),
                                textStyle: NeumorphicTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               NeumorphicButton(
                 onPressed: (){
                   reset();
                 },
                 style: NeumorphicStyle(
                   depth: 3,
                   intensity: 1,
                 ),
                 child:  NeumorphicText(
                   "Reset",
                   style: NeumorphicStyle(
                     color: Colors.black,
                   ),
                   textStyle: NeumorphicTextStyle(
                     fontWeight: FontWeight.w500,
                     fontSize: 25,
                   ),
                 ),
               ),
                NeumorphicButton(
                  onPressed: (){
                    addLaps();
                  },
                  style: NeumorphicStyle(
                    depth: 3,
                    intensity: 1,
                  ),
                  child:  NeumorphicText(
    "Lap",
    style: NeumorphicStyle(
    color: Colors.black,
    ),
    textStyle: NeumorphicTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 25,
    ),
    ),
                ),
                NeumorphicButton(
                  onPressed: (){
                    (!started)?start():stop();
                  },
                  style: NeumorphicStyle(
                    depth: 3,
                    intensity: 1,
                  ),
                  child:  NeumorphicText(
                    (!started) ? "Start":"Pause",
                    style: NeumorphicStyle(
                      color: Colors.black,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
