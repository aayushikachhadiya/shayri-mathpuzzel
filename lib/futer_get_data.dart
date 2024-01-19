import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: p1(),debugShowCheckedModeBanner: false,));
}
class p1 extends StatefulWidget {
  const p1({super.key});

  @override
  State<p1> createState() => _p1State();
}

class _p1State extends State<p1> {
  int a=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  Future get()
  async {
    await Future.delayed(Duration(seconds: 5));
    a=10;
    return a;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("second"),
    ),
      body: FutureBuilder(
        initialData: 0,
        future: get(),
        builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done)
          {
            return Center(child: Text("A=$a"),);
          }else
            {
                      return Center(child: CircularProgressIndicator(),);
            }
      },),
    );
  }
}
