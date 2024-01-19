import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'package:untitled/shayri1.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: shayri(),));
}
class shayri extends StatefulWidget {
  const shayri({super.key});

  @override
  State<shayri> createState() => _shayriState();
}

class _shayriState extends State<shayri> {
  List <bool> temp=List.filled(data.arr.length, false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Love Shayri😊",style: TextStyle(fontSize: 30,fontFamily: "one")),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent,
     actions: [
       Icon(Icons.share),
       Icon(Icons.more_vert),

     ],

    ),
      body: ListView.builder(itemCount: data.arr.length,itemBuilder: (context, index) {
        return Card(child: GestureDetector(
        onTapUp: (details) {
          temp[index]=false;
          setState(() {

          });
        },
          onTapDown: (details) {
            temp[index]=true;
            setState(() {

            });
          },
          onTapCancel: () {
            temp[index]=false;
            setState(() {

            });
          },
        child: ListTile(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return shayri1(index);
          },));
        },
          leading:Image(image: AssetImage("${data.img[index]}"),height: 60,width: 60),
          title: Text("${data.arr[index]}"),
          trailing: (temp[index]==true)?Icon(Icons.arrow_forward_ios_rounded):null,
          tileColor: (temp[index]==true)?Colors.pink:null,
        ),)

        );
      },
      ),

    );
  }
}
