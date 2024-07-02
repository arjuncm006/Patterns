import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvertedRightPyramidPage extends StatefulWidget {
  @override
  _InvertedRightPyramidPageState createState() => _InvertedRightPyramidPageState();
}

class _InvertedRightPyramidPageState extends State<InvertedRightPyramidPage> {
  final _formKey = GlobalKey<FormState>();
  late int _size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inverted Right Pyramid'),
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
                      String pyramid = InvertedRightPyramid(_size);
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

  String InvertedRightPyramid(int n) {
    String result = '';
    for (int i = 0; i < n; i++) {
      for (int j = n; j > i; j--) {
        result += '* ';
      }
      result += '\n';
    }
    return result;
  }
}