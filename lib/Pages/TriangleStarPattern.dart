import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TriangleStarPattern extends StatefulWidget {
  @override
  _TriangleStarPatternState createState() => _TriangleStarPatternState();
}

class _TriangleStarPatternState extends State<TriangleStarPattern> {
  final _formKey = GlobalKey<FormState>();
  late int _size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangle Star Pattern'),
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
                      String pattern = printTriangleStarPattern(_size);
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

  String printTriangleStarPattern(int n) {
    String pattern = '';
    for (int i = 0; i < n; i++) {
      for (int j = 0; j <= i; j++) {
        pattern += '* ';
      }
      pattern += '\n';
    }
    return pattern;
  }
}