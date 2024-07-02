import 'package:flutter/material.dart';

class StackContainer extends StatelessWidget {

  final String text ;
   StackContainer({
    super.key, required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(
          child: Center(child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          )),
          width: 150,
          height: 120,
          margin: EdgeInsets.all( 15),


          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 10,
              ),
            ],
            gradient:   LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff002fff),
                Color(0xff00f4ff),
              ],
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: 35, // <--- Set left to null
          right: 35,

          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],

            ),
            width: 100,
            height: 60,
            child: Icon(Icons.output_rounded),

          ),
        )

      ],
    );
  }
}