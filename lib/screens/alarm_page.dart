import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:time_clock/utils/alarm.dart';

class alrampage extends StatefulWidget {
  const alrampage({super.key});

  @override
  State<alrampage> createState() => _alrampageState();
}

class _alrampageState extends State<alrampage> {
  DateTime time = DateTime.now();
  double sec=(3*pi)/2;
  int secDigital=0;
  double min=(3*pi)/2;
  int minDigital=0;
  double hour=(3*pi)/2;
  int hourDigital=0;
  @override
  void initState() {
    super.initState();

    setState(() {
      minDigital = time.minute;
      secDigital = time.second;
      hourDigital = time.hour;

      sec=sec+secDigital*(pi/30);
      min=min+minDigital*(pi/30);
      hour=hour+hourDigital*(pi/6);
    });

    timer();
  }
  void timer() {

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (secDigital >= 59) {
          sec = (3 * pi) / 2;
          secDigital = 0;
          minDigital++;
          min = min + (pi / 30);
        }
        else if (minDigital >= 59) {
          min = (3 * pi) / 2;
          minDigital = 0;
          hour = hour + (pi / 6);
          hourDigital++;
        }
        else {
          secDigital++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }
  String formatTime(int time) {
    if (time < 10) {
      return '0$time';
    } else {
      return '$time';
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(
          "Alarm Clock",
          style: NeumorphicStyle(
            color: Colors.black,
          ),
          textStyle: NeumorphicTextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
     // backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Neumorphic(
                        style: NeumorphicStyle(
                          depth: 3,
                          intensity: 1,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: Container(
                          width: 370,
                          height: 230,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://slm-assets.secondlife.com/assets/14690574/view_large/PIC_New_Moon_with_Sparkling_Stars_1_4x4.jpg?1469951004",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            intensity: 1,
                            boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 370,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NeumorphicText(
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 3,
                                        intensity: 1,
                                      ),
                                      "${formatTime(hourDigital)}",
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 56,
                                      ),
                                    ),
                                    Padding(
                                        padding:EdgeInsets.only(left: 10,top: 20),
                                     child:  NeumorphicText(
                                       style: NeumorphicStyle(
                                         color: Colors.black,
                                         depth: 3,
                                         intensity: 1,
                                       ),
                                       "Hour",
                                       textStyle: NeumorphicTextStyle(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 20,
                                       ),
                                     ),
                                      ),
                                    NeumorphicText(
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                        depth: 3,
                                        intensity: 1,
                                      ),
                                      " : ${formatTime(minDigital)}",
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 56,
                                      ),
                                    ),
                                    Padding(
                                      padding:EdgeInsets.only(left: 10,top: 20),
                                      child:  NeumorphicText(
                                        style: NeumorphicStyle(
                                          color: Colors.black,
                                          depth: 3,
                                          intensity: 1,
                                        ),
                                        "Min",
                                        textStyle: NeumorphicTextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              //color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            children: [
                              NeumorphicText(
                                "Alarm",
                                textStyle: NeumorphicTextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                ),
                                style: NeumorphicStyle(
                                  color: Colors.black,
                                  depth: 3,
                                  intensity: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ...Clock.allalarm.map((e)=>Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Neumorphic(
                                style : NeumorphicStyle(
                                  depth : 2,
                                  intensity: 1,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(22),
                                  ),
                                  //color: Colors.white,
                                ),
                                child: Container(
                                  height: 90,
                                  width: 370,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            NeumorphicText(
                                              "${e['time']}",
                                              textStyle: NeumorphicTextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30,
                                              ),
                                              style: NeumorphicStyle(
                                                color: Colors.black,
                                                depth: 3,
                                                intensity: 1,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8,left: 5),
                                              child: NeumorphicText(
                                                "${e['am/pm']}",
                                                textStyle: NeumorphicTextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                ),
                                                style: NeumorphicStyle(
                                                  color: Colors.black,
                                                  depth: 3,
                                                  intensity: 1,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right:15 ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  e['switch']=!e['switch'];
                                                });
                                              },
                                              child: Switch(
                                                  value: e['switch'],
                                                  onChanged: (val){
                                                    setState(() {
                                                      e['switch']=val;
                                                    });
                                                  }
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
