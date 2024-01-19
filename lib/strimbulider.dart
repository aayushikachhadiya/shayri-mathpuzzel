import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: strim(),));
}
class strim extends StatefulWidget {
  const strim({super.key});

  @override
  State<strim> createState() => _strimState();
}

class _strimState extends State<strim> {
  int a=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  Stream get()
  async* {

    for(int i=1;i<=10;i++)
      {
       a=i;
        await Future.delayed(Duration(seconds: 1));
        yield a;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("time"),
    ),
      body:  StreamBuilder(
        initialData: 0,
        stream: get(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done ||snapshot.connectionState==ConnectionState.active)
          {
            int x=snapshot.data;
            return Center(child: Text("A=$x",style: TextStyle(fontSize: 30)),);
          }else
          {
            return Center(child: CircularProgressIndicator(),);
          }
        },),
    );
  }
}
