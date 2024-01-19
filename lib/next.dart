import 'package:flutter/material.dart';
import 'package:untitled/preferens.dart';

class next extends StatefulWidget {
int a;
next(this.a);
  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  int a=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  {
      a=home.prefs!.getInt("number")??0;
      setState(() {

      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Column(children: [
      Text("A=$a"),
      ElevatedButton(onPressed: () {
        a++;
        home.prefs?.setInt("number", a);
        setState(() {

        });
      }, child: Text("submit")),
      ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return home();
      },));
      }, child: Text("firts")),
    ]),
    );
  }
}
