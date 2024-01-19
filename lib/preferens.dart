import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/next.dart';

void main()
{
  runApp(MaterialApp(home: home(),));
}
class home extends StatefulWidget {
  static SharedPreferences? prefs;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
int a=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    home.prefs = await SharedPreferences.getInstance();
    a=home.prefs!.getInt("number")??0;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("1"),),
    body:Column(children: [
      Text("A=$a"),
      ElevatedButton(onPressed: () {
        a++;
        home.prefs?.setInt("number", a);
        setState(() {

        });
      }, child: Text("submit")),
      ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return next(a);
      },));
      }, child: Text("next"))
    ]),
    );
  }
}
