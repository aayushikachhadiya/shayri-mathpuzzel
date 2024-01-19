import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: alert(),));
}
class alert extends StatefulWidget {
  const alert({super.key});

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("alert"),
      backgroundColor: Colors.lightGreenAccent,
    ),
      body: ElevatedButton(onPressed: () {
        showDialog(barrierColor: Colors.transparent,barrierDismissible: false,context: context, builder: (context) {
          return AlertDialog(
            title: Text("hello good morning"),
            actions: [
              Row(children: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("OK")),
                TextButton(onPressed: () {

                }, child: Text("Cancle")),
              ],)
            ],
          );
        },);
      }, child: Text("submit"),),
    );
  }
}
