import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: direction(),));
}
class direction extends StatefulWidget {
  const direction({super.key});

  @override
  State<direction> createState() => _directionState();
}

class _directionState extends State<direction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("direction"),
      backgroundColor: Colors.yellow,
    ),
      body: SingleChildScrollView(child:
      Column(children: [
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ],),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.lightGreenAccent,
          ),
        ],),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.yellow,
          ),
        ],),
        Row(children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],)
      ]),)
    );
  }
}
