import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
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

      if (hourDigital > 12) {
        hourDigital = hourDigital - 12;
      }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(
          "Strap Watch",
          style: NeumorphicStyle(
            color: Colors.black,
            depth:2,
            intensity: 1,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
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
                          CircularProgressIndicator(
                            value: hourDigital * (1/12),
                            color: Colors.blue.shade300,
                            strokeWidth: 12,
                            strokeAlign: 15,
                            strokeCap: StrokeCap.round,
                          ),
                          CircularProgressIndicator(
                            value: minDigital * (1/60),
                            color: Colors.pink.shade200,
                            strokeWidth: 12,
                            strokeAlign: 20,
                            strokeCap: StrokeCap.round,
                          ),
                          CircularProgressIndicator(
                            value: secDigital * (1/60),
                            color: Colors.green.shade200,
                            strokeWidth: 12,
                            strokeAlign: 24,
                            strokeCap: StrokeCap.round,
                          ),
                          Transform.rotate(
                            angle: sec,
                            child: Divider(
                              indent: MediaQuery.of(context).size.width/2.3,
                              thickness: 3,
                              endIndent: 30,
                              color: Colors.green.shade200,
                            ),
                          ),
                          Transform.rotate(
                            angle: min,
                            child: Divider(
                              indent: MediaQuery.of(context).size.width/2.3,
                              thickness: 3,
                              endIndent: 50,
                              color: Colors.pink.shade200,
                            ),
                          ),
                          Transform.rotate(
                            angle: hour,
                            child: Divider(
                              indent: MediaQuery.of(context).size.width/2.3,
                              thickness: 3,
                              endIndent: 80,
                              color: Colors.blue,
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
    );
  }
}
