// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                "POMOTIMER",
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
                    "12",
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
                    "57",
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
                      Container(
                          margin: const EdgeInsets.only(left: 13, right: 13),
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor.withOpacity(1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 10,
                                  color: Theme.of(context).cardColor)),
                          child: Text("${15 + i * 5}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Theme.of(context).backgroundColor,
                              )))
                  ],
                ),
              )),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.pause_circle_filled_outlined),
              onPressed: () {},
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
                      "0/4",
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
                      "0/12",
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
