import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:patterns/Pages/InvertedNumberedPyramidPage.dart';
import 'package:patterns/Pages/InvertedRightPyramidPage.dart';
import 'package:patterns/Pages/RightAngledNumberPyramidPage.dart';
import 'package:patterns/Pages/RightAngledNumber_Pyramid_II.dart';
import 'package:patterns/Pages/TriangleStarPattern.dart';

import 'package:patterns/components/stACKcONTAINER.dart';

import 'HollowRectangularStarPattern.dart';
import 'RectangularStarPattern.dart';

class PatternPrinter extends StatefulWidget {
  @override
  Home_Page createState() => Home_Page();
}

class Home_Page extends State<PatternPrinter> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pattern '),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black38,
                  Colors.black12,

                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                Colors.black38,
                Colors.black12,
                Colors.black12,
                Colors.black38,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: 50,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "List of Patterns",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RectangularStarPattern()),
                          );
                        },
                        child: StackContainer(
                          text: 'Rectangular Star Pattern',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HollowRectangularStarPattern()),
                          );
                        },
                        child: StackContainer(
                          text: 'Hollow RectangularStar',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TriangleStarPattern()),
                          );
                        },
                        child: StackContainer(
                          text: 'Triangle Star',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RightAngledNumberPyramidPage()),
                          );
                        },
                        child: StackContainer(
                          text: 'Right Angled Number Pyramid',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RightAngledNumberPyramidIIPage()),
                          );
                        },
                        child: StackContainer(
                          text: 'Right Angled Number Pyramid II',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InvertedRightPyramidPage()),
                          );
                        },
                        child: StackContainer(
                          text: 'Inverted Right Pyramid',
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InvertedNumberedPyramidPage()),
                          );
                        },
                        child: StackContainer(
                          text: 'Inverted Numbered Pyramid',
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
