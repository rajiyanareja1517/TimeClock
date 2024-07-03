import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
class digitalClock extends StatefulWidget {
  const digitalClock({super.key});

  @override
  State<digitalClock> createState() => _digitalClockState();
}

class _digitalClockState extends State<digitalClock> {
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
          "Digital Clock",
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                child: Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: 320,
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
                            "${formatTime(hourDigital)} : ${formatTime(minDigital)} : ${formatTime(secDigital)}",
                            textStyle: NeumorphicTextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NeumorphicText(
                            "Hour",
                            style: NeumorphicStyle(
                              color: Colors.black,
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 22,
                            ),
                          ),
                          NeumorphicText(
                            "Min",
                            style: NeumorphicStyle(
                              color: Colors.black,
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 22,
                            ),
                          ),
                          NeumorphicText(
                            "Sec",
                            style: NeumorphicStyle(
                              color: Colors.black,
                            ),
                            textStyle: NeumorphicTextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,color: Colors.black
                  ),
                  onPressed: (){},
                  child: (hourDigital>12)
                  ?Icon(
                    Icons.sunny,
                    color: Colors.white,
                  )
                 : Icon(
                    Icons.nightlight_round_outlined,
                    color: Colors.white,
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
