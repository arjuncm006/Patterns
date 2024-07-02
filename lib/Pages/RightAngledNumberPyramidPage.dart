import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightAngledNumberPyramidPage extends StatefulWidget {
  @override
  _RightAngledNumberPyramidPageState createState() => _RightAngledNumberPyramidPageState();
}

class _RightAngledNumberPyramidPageState extends State<RightAngledNumberPyramidPage> {
  final _formKey = GlobalKey<FormState>();
  late int _size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Right-Angled Number Pyramid'),
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
                    labelText: 'Enter size of the pyramid',
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
                      String pyramid = RightAngledNumberPyramid(_size);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Pyramid'),
                            content: Text(pyramid),
                          );
                        },
                      );
                    }
                  },
                  child: Center(child: Text('Print Pyramid')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String RightAngledNumberPyramid(int n) {
    String result = '';
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        result += '$j ';
      }
      result += '\n';
    }
    return result;
  }
}