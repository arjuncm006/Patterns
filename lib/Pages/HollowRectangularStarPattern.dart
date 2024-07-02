import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HollowRectangularStarPattern extends StatefulWidget {
  @override
  _HollowRectangularStarPatternState createState() => _HollowRectangularStarPatternState();
}
class _HollowRectangularStarPatternState extends State<HollowRectangularStarPattern> {
  final _formKey = GlobalKey<FormState>();
  late int _size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hollow Rectangular Star Pattern'),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter size of the pattern',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                  onSaved: (value) => _size = int.parse(value!),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      String pattern = printHollowRectangularStarPattern(_size);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Pattern'),
                            content: Text(pattern),
                          );
                        },
                      );
                    }
                  },
                  child: Center(child: Text('Print Pattern')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String printHollowRectangularStarPattern(int n) {
    String pattern = '';
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i == 0 || i == n - 1 || j == 0 || j == n - 1) {
          pattern += '* ';
        } else {
          pattern += '  ';
        }
      }
      pattern += '\n';
    }
    return pattern;
  }
}