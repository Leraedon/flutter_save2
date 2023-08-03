// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const minute = 60;
  static const breakSeconds = 300;
  int totalSeconds = 1500;
  int minuteSelected = 2;
  int totalRounds = 0;
  int totalGoals = 0;
  bool isRunning = false;
  bool isBreaking = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        if (totalRounds >= 3) {
          totalGoals = totalGoals + 1;
          totalRounds = 0;
          isBreaking = true;
          totalSeconds = breakSeconds;
        } else if (isBreaking) {
          totalSeconds = 900 + (minuteSelected * minute * 5);
          isBreaking = false;
          isRunning = false;
          timer.cancel();
        } else {
          totalRounds = totalRounds + 1;
          totalSeconds = 900 + (minuteSelected * minute * 5);
          //isRunning = false;
        }
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onResetPressed(int index) {
    setState(() {
      if (!isBreaking) {
        minuteSelected = index;
        totalSeconds = 900 + (minuteSelected * minute * 5);
      }
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  List<String> format(int seconds) {
    var duration = Duration(seconds: seconds);
    return [
      duration.toString().split(".").first.split(":")[1],
      duration.toString().split(".").first.split(":")[2]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                isBreaking ? "POMOTIMER (BREAKING)" : "POMOTIMER",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  letterSpacing: 1.15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    format(totalSeconds)[0],
                    style: TextStyle(
                        fontSize: 47,
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  ":",
                  style: TextStyle(
                    fontSize: 90,
                    color: Theme.of(context).cardColor.withOpacity(0.45),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                  margin: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    format(totalSeconds)[1],
                    style: TextStyle(
                        fontSize: 47,
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      InkWell(
                        onTap: () {
                          onResetPressed(i);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(left: 13, right: 13),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            decoration: BoxDecoration(
                                color: i == minuteSelected
                                    ? Theme.of(context).cardColor
                                    : Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).cardColor)),
                            child: Text("${15 + i * 5}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: i == minuteSelected
                                      ? Theme.of(context).backgroundColor
                                      : Theme.of(context).cardColor,
                                ))),
                      )
                  ],
                ),
              )),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: IconButton(
              icon: Icon(isBreaking
                  ? Icons.remove_circle_outlined
                  : isRunning
                      ? Icons.pause_circle_filled_outlined
                      : Icons.play_circle_fill_outlined),
              onPressed: isBreaking
                  ? () {}
                  : isRunning
                      ? onPausePressed
                      : onStartPressed,
              iconSize: 88,
              color: Theme.of(context).cardColor.withOpacity(0.5),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "$totalRounds/4",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Theme.of(context).cardColor.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      "ROUND",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "$totalGoals/12",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          color: Theme.of(context).cardColor.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      "GOAL",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      ]),
    );
  }
}
