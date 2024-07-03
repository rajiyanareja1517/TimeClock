import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  DateTime time = DateTime.now();
  double sec = (3 * pi) / 2;
  int secDigital = 0;
  double min = (3 * pi) / 2;
  int minDigital = 0;
  double hour = (3 * pi) / 2;
  int hourDigital = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      minDigital = time.minute;
      secDigital = time.second;
      hourDigital = time.hour;

      sec = sec + secDigital * (pi / 30);
      min = min + minDigital * (pi / 30);
      hour = hour + hourDigital * (pi / 6);
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
        } else if (minDigital >= 59) {
          min = (3 * pi) / 2;
          minDigital = 0;
          hour = hour + (pi / 6);
          hourDigital++;
        } else {
          secDigital++;
          sec = sec + (pi / 30);
        }
      });
      timer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(
          "HomePage",
          style: NeumorphicStyle(
            color: Colors.black,
            depth: 2,
            intensity: 1,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 5,
                            intensity: 0.8,
                            boxShape: NeumorphicBoxShape.circle(),
                          ),
                          child: SizedBox(
                            height: 362,
                            width: 362,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: sec,
                                  child: Divider(
                                    indent:
                                        MediaQuery.of(context).size.width / 2.3,
                                    thickness: 2,
                                    endIndent: 30,
                                    color: Colors.blue,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: min,
                                  child: Divider(
                                    indent:
                                        MediaQuery.of(context).size.width / 2.3,
                                    thickness: 2,
                                    endIndent: 50,
                                    color: Colors.orange,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: hour,
                                  child: Divider(
                                    indent:
                                        MediaQuery.of(context).size.width / 2.3,
                                    thickness: 2,
                                    endIndent: 80,
                                    color: Colors.green,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: (3 * pi) / 2,
                                      child: Divider(
                                        indent: 342,
                                        thickness: 3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "9",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Transform.rotate(
                                  angle: (2 * pi) / 2,
                                  child: Divider(
                                    indent: 347,
                                    thickness: 3,
                                    color: Colors.black,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: (30 * pi),
                                      child: Divider(
                                        indent: 347,
                                        thickness: 3,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Transform.rotate(
                                  angle: 15 * (pi / 30),
                                  child: Divider(
                                    indent: 347,
                                    thickness: 3,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Transform.rotate(
                                      angle: (pi * 30),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          "3",
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 300),
                                  child: Transform.rotate(
                                    angle: (pi * 30),
                                    child: Text(
                                      "12",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 300),
                                  child: Transform.rotate(
                                    angle: (pi * 30),
                                    child: Text(
                                      "6",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
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
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              //color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('digital_Clock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                depth: 3,
                                intensity: 1,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: NeumorphicText(
                                      "Digital Clock",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 100,
                                    child: Icon(
                                      Icons.numbers,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('analog_Clock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                depth: 3,
                                intensity: 1,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: NeumorphicText(
                                      "Analog Clock",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 100,
                                    child: Icon(
                                      Icons.watch_later,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('strap_Clock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                depth: 3,
                                intensity: 1,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: NeumorphicText(
                                      "Strap Clock",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 100,
                                    child: Icon(
                                      Icons.punch_clock,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('stop_Watch');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                depth: 3,
                                intensity: 1,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: NeumorphicText(
                                      "Stop Watch",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 100,
                                    child: Icon(
                                      Icons.stop_circle_outlined,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('alram_Clock');
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                depth: 3,
                                intensity: 1,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: NeumorphicText(
                                      "Alarm Clock",
                                      style: NeumorphicStyle(
                                        color: Colors.black,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 100,
                                    child: Icon(
                                      Icons.alarm_rounded,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

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
