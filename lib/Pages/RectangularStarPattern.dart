import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RectangularStarPattern extends StatefulWidget {
  @override
  _RectangularStarPatternState createState() => _RectangularStarPatternState();
}

class _RectangularStarPatternState extends State<RectangularStarPattern> {
  final _formKey = GlobalKey<FormState>();
  late int _size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectangular Star Pattern'),
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
                      String pattern = printRectangularStarPattern(_size);
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

  String printRectangularStarPattern(int n) {
    String _output = '';
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        _output += '* ';
      }
      _output += '\n';
    }
    return _output;
  }
}