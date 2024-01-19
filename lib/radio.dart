import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: radio(),));
}
class radio extends StatefulWidget {
  const radio({super.key});

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  String gender="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Radio"),
    ),
      body: Row(children: [
        Radio(value: "male", groupValue: gender, onChanged: (value) {
          gender=value!;
          setState(() {

          });
        },
        ),
        Text("male"),
        Radio(value: "female", groupValue: gender, onChanged: (value) {
          gender=value!;
          setState(() {

          });
        },
        ),
        Text("female"),
      ]),
    );
  }
}
